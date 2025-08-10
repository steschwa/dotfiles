def --env goto [] {
    let dirs = [
        ...(subdirs "/Users/stefan/.config"),
        ...(subdirs "/Users/stefan/projects"),
    ]

    let selection = $dirs | to text | fzf --reverse --height=20
    if ($selection | is-empty) {
        return
    }

    cd $selection

    let title = $selection | path basename
    print -n $"(ansi title)($title)(ansi st)" 

    clear
}

def subdirs [root: string]: nothing -> list<string> {
    ls $root | where type == "dir" | get name
}
