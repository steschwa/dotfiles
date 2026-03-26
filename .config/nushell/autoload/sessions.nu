# go to an existing kitty session
export def 'session activate' [] {
    let data = _open_session_file 

    let inactive_sessions = $data.sessions | where $it != $data.active_session

    let session_to_activate = [
        $"($data.active_session) \(active\)",
        ...$inactive_sessions
    ]
    | to text
    | fzf --prompt 'activate session: ' --ghost $data.active_session

    kitten @ action goto_session $session_to_activate
}

# list all currently created sessions
export def 'session list' [] {
    let data = _open_session_file 

    $data.sessions
    | wrap session
    | insert is_active {|it| 
        if $it.session == $data.active_session {
            '✅'
        } else {
            '❌'
        }
    }
}

# create a new kitty session
export def 'session create' [] {
    let template_file = '~/.config/kitty/sessions/default.kitty-session'
    let name = input --default 'default' 'name of new session: ' 

    if not ($template_file | path exists) {
        error make $'invalid session template: ($template_file)'
    }

    let session_file = $'/tmp/($name).kitty-session'
    if ($session_file | path exists) {
        error make $'session file ($session_file) already exists'
    }

    cp $template_file $session_file
    kitten @ action goto_session $session_file
    rm --permanent $session_file
}

# close the current kitty session
export def 'session close' [] {
    kitten @ action close_session .
}

def _open_session_file []: nothing -> record<active_session: string, sessions: list<string>> {
    if ('KITTY_PID' not-in $env) {
        error make 'missing KITTY_PID environment variable' 
    }

    let filename = $'/tmp/kitty-($env.KITTY_PID)-sessions.json'
    if not ($filename | path exists) {
        error make 'sessions file does not exist'
    }

    open $filename
}
