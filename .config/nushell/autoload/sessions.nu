# go to an existing kitty session
export def 'session activate' [] {
    let windows = kitten @ ls 
    | from json 
    | get 0.tabs.windows 
    | flatten

    let sessions = $windows 
    | get session_name 
    | uniq

    let active_session_name = $windows 
    | where is_self == true 
    | get session_name.0

    let active_session_index = $sessions
    | enumerate
    | where $it.item == $active_session_name
    | get 0.index

    $sessions
    | each {|session|
      let session_windows = $windows | where session_name == $session

      {
        name: $session,
        active: ($session == $active_session_name),
        claude_status: (
          $session_windows
          | get user_vars.claude-status?
          | each {
            match $in {
              'idle' => $'(ansi green)●(ansi reset)',
              'working' => $'(ansi yellow)●(ansi reset)',
              'blocked' => $'(ansi red)●(ansi reset)'
            }
          }
        ),
        devserver_running: (
          $session_windows
          | get user_vars.reonic-devserver?
          | where $it == 'true'
          | is-not-empty
        )
      }
    }
    | each {|it|
      let header = if $it.active {
        $"($it.name) \(active\)" 
      } else { 
        $'($it.name) '
      }

      let footer = $it.claude_status
      | append (if $it.devserver_running { $'(ansi green)►(ansi reset)' })
      | where ($it | is-not-empty)
      | str join ' '

      [$header, $footer]
      | where ($it | is-not-empty) 
      | str join (char newline)
    }
    | str join (char nul)
    | (
      fzf
      --ansi
      --read0
      --delimiter ' '
      --accept-nth 1
      --nth 1
      --prompt 'activate session: ' 
      --ghost $active_session_name
      --bind $"load:pos\(($active_session_index + 1)\)"
      --bind 'change:first'
      --gap 1
      --gap-line ' '
    )
    | kitten @ action goto_session $in
}

# list all currently created sessions
export def 'session list' [] {
    let windows = kitten @ ls 
    | from json 
    | get 0.tabs.windows 
    | flatten

    let active_session_name = $windows 
    | where is_self == true 
    | get session_name.0

    $windows 
    | get session_name 
    | uniq   
    | wrap session
    | insert is_active {|it|
      if $it.session == $active_session_name {
        '✅'
      } else {
        '❌'
      }
    }
}

# create a new kitty session
export def 'session create' [] {
    let template_file = '~/.config/kitty/sessions/default.kitty-session' | path expand
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
