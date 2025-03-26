const COMPOSE_FILE = "~/lobe-chat.compose.yaml" | path expand 

export def upgrade [] {
    let current_tag = get_container_tag 
    let tag = get_latest_container_tag

    if ($tag == $current_tag) {
        print "already at latest tag"
        return
    }

    print $"upgrading lobe-chat to ($tag)"

    print "stopping lobe-chat container"
    docker compose -f $COMPOSE_FILE down

    set_container_tag $tag

    print "starting lobe-chat container"
    docker compose -f $COMPOSE_FILE up -d

    print "deleting old lobe-chat image"
    docker image rm $"lobehub/lobe-chat:($current_tag)"
}

def get_latest_container_tag []: nothing -> string {
    http get https://hub.docker.com/v2/repositories/lobehub/lobe-chat/tags 
    | get results 
    | where name != "latest"
    | each {|it| 
        {
            tag: $it.name,
            date: ($it.last_updated | into datetime) 
        } 
    }
    | sort-by date --reverse
    | first
    | get tag
}

def get_container_tag []: nothing -> string {
    open $COMPOSE_FILE
    | get services.lobe-chat.image 
    | split column ':' image tag
    | get tag.0
}

def set_container_tag [tag: string] {
    open $COMPOSE_FILE
    | update services.lobe-chat.image $"lobehub/lobe-chat:($tag)"
    | save -f $COMPOSE_FILE
}
