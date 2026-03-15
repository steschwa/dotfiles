# go to an already existing kitty session
export def 'session activate' [] {
    let active_session = _get_active_session

    let session_to_activate = _get_active_sessions
    | each {|session| 
        if $session == $active_session {
            $"($session) \(active\)"
        } else {
            $session
        } 
    }
    | to text
    | fzf --prompt 'activate session: ' --ghost $active_session

    kitten @ action goto_session $session_to_activate
}

# list all currently active sessions
export def 'session list' [] {
    _get_active_sessions | get name
}

# create a new (empty) kitty session
export def 'session create' [] {
    let name = input 'name of new session: ' 

    let session_file = $'/tmp/($name).kitty-session'
    if ($session_file | path exists) {
        error make 'session file already exists'
    }

    [
        'new_tab',
        'launch'
    ] 
    | save -f $session_file

    kitten @ action goto_session $session_file
    rm $session_file
}

# close the current kitty session
export def 'session close' [] {
    kitten @ action close_session .
}

def _open_session_file [] {
    if ('KITTY_PID' not-in $env) {
        error make 'missing KITTY_PID environment variable' 
    }

    let filename = $'/tmp/kitty-($env.KITTY_PID)-sessions.json'
    if not ($filename | path exists) {
        error make 'sessions file does not exist'
    }

    open $filename
}

def _get_active_session []: nothing -> string {
    _open_session_file | get active_session
}

def _get_active_sessions [] {
    _open_session_file | get sessions
}
