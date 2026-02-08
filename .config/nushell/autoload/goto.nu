def --env goto [] {
    let dirs = [
        ...(subdirs "/Users/stefan/.config"),
        ...(subdirs "/Users/stefan/projects"),
    ]


    let selection = $dirs | to text | fzf --prompt='goto directory: '
    if ($selection | is-empty) {
        return
    }

    cd $selection

    let title = $selection | path basename
    print --no-newline $"(ansi title)($title)(ansi st)" 

    clear
}

def subdirs [root: string]: nothing -> list<string> {
    ls $root | where type == "dir" | get name
}
