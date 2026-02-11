$env.config.keybindings ++= [
    {
        name: history_menu
        modifier: control
        keycode: char_r
        mode: [emacs, vi_insert, vi_normal]
        event: {
            send: executehostcommand
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
    },
    {
        name: goto
        modifier: control
        keycode: char_g
        mode: [emacs, vi_insert, vi_normal]
        event: {
            send: executehostcommand
            cmd: goto
        }
    },
    {
        name: clear_line
        modifier: control
        keycode: char_u
        mode: [emacs, vi_insert]
        event: {
            edit: clear
        }
    }
]
