#!/opt/homebrew/bin/nu

let session = agtermctl tree --json --socket $env.AGT_SOCKET 
  | from json
  | get result.tree.workspaces 
  | each { $in.sessions } 
  | flatten
  | where id == $env.AGT_SESSION_ID 
  | first

if $session.split {
  # split close only kills the right pane, so swap the focused primary into it first
  if not ($session.splitFocused? | default false) {
    agtermctl session swap --target $env.AGT_SESSION_ID --socket $env.AGT_SOCKET
  }

  agtermctl session split close --target $env.AGT_SESSION_ID --socket $env.AGT_SOCKET
} else {
  agtermctl session close --target $env.AGT_SESSION_ID --socket $env.AGT_SOCKET
}
