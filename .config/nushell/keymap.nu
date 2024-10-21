def --env keymap [spec: record] {
    $env.config.keybindings = ($env.config.keybindings | append $spec)
}

keymap {
    name: help_menu
    modifier: control
    keycode: char_h
    mode: [emacs, vi_insert, vi_normal]
    event: {
        send: menu,
        name: help_menu 
    }
}

keymap {
    name: history_menu
    modifier: control
    keycode: char_r
    mode: [emacs, vi_insert, vi_normal]
    event: {
        send: ExecuteHostCommand
        cmd: "commandline edit (
            history
            | get command
            | each { lines | str trim | str join ' ' }
            | uniq
            | reverse
            | str join (char newline)
            | fzf --scheme=history --height=20 --layout=reverse -q (commandline)
        )"
    }
}
