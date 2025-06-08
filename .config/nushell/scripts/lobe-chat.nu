const COMPOSE_FILE = "~/.config/lobe-chat/lobe-chat.compose.yaml" | path expand 


export def upgrade [] {
    let current_tag = get_container_tag 
    let next_tag = get_latest_container_tag

    if ($next_tag == $current_tag) {
        print $"(ansi green)already at latest tag(ansi reset)"
        return
    }

    show_changelog $current_tag $next_tag

    let res = ["yes", "no"] | input list $"(ansi green)upgrade lobe-chat from ($current_tag) to ($next_tag)?(ansi reset)"
    if $res != "yes" {
        return
    }

    print $"(ansi green)upgrading lobe-chat from ($current_tag) to ($next_tag)(ansi reset)"

    print $"(ansi green)stopping lobe-chat container(ansi reset)"
    docker compose -f $COMPOSE_FILE down

    print $"(ansi green)pulling lobehub/lobe-chat image(ansi reset)"
    docker image pull $"lobehub/lobe-chat:($next_tag)"

    set_container_tag $next_tag
    print $"(ansi green)starting lobe-chat container(ansi reset)"
    docker compose -f $COMPOSE_FILE up -d

    print $"(ansi green)deleting old lobe-chat image(ansi reset)"
    docker image rm $"lobehub/lobe-chat:($current_tag)"

    print $"(ansi green)commiting changes(ansi reset)"
    yadm add $COMPOSE_FILE
    yadm cm $"chore\(lobe-chat\): upgrade to ($next_tag)"
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

def get_changelog [tag: string]: nothing -> string {
    http get $"https://raw.githubusercontent.com/lobehub/lobe-chat/v($tag)/CHANGELOG.md"
}

def show_changelog [current_tag: string, next_tag: string] {
    const CHANGELOG_CURRENT = "/tmp/lobe-hub-current.md"
    const CHANGELOG_NEXT = "/tmp/lobe-hub-next.md"

    get_changelog $current_tag | save -f $CHANGELOG_CURRENT
    get_changelog $next_tag | save -f $CHANGELOG_NEXT

    print $"(ansi green)changelog from ($current_tag) to ($next_tag)(ansi reset)"
    rg --fixed-strings --invert-match --line-regexp --no-line-number --file $CHANGELOG_CURRENT $CHANGELOG_NEXT
}
