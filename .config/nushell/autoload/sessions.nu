let sessions_dir = '~/.config/kitty/sessions' | path expand

# go to an already existing kitty session
export def 'session activate' [] {
    let session_files = ls ($sessions_dir | path join '*.kitty-session' | into glob) | get name
    
    let active_sessions = _get_active_sessions
    let inactive_sessions = $session_files 
    | path parse 
    | get stem
    | where $it not-in ($active_sessions.name)

    let session_to_activate = [
        ...($active_sessions | each {|it| $"($it.name) \(active\)" })
        ...$inactive_sessions
    ]
    | to text
    | fzf --prompt 'activate session: ' --ghost (_get_active_session_name)

    kitten @ action goto_session ($sessions_dir | path join $'($session_to_activate).kitty-session')
}

# list all currently active sessions
export def 'session list' [] {
    _get_active_sessions | get name
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

def _get_active_session_name []: nothing -> string {
    _open_session_file | get active_session
}

def _get_active_sessions [] {
    _open_session_file | get sessions | transpose name tabs
}
