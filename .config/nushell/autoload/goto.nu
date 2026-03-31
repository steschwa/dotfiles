def --env goto [
    --create-session
] {
    let dirs = [
        ...(_subdirs "/Users/stefan/.config"),
        ...(_subdirs "/Users/stefan/projects"),
    ]

    let selection = $dirs | to text | fzf --prompt='goto directory: '
    if ($selection | is-empty) {
        return
    }

    let title = $selection | path basename

    if $create_session {
        let session_file_content = [
            $'new_tab ($title)',
            $'cd ($selection)',
            'launch'
        ]  

        let session_file_path = $'/tmp/($title).kitty-session'
        $session_file_content | str join "\n" | save -f $session_file_path

        kitten @ action goto_session $session_file_path
        rm $session_file_path
    } else {
        cd $selection
        print --no-newline $"(ansi title)($title)(ansi st)" 
        clear
    }
}

def _subdirs [root: string]: nothing -> list<string> {
    ls $root | where type == "dir" | get name
}
