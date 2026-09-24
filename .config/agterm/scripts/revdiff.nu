#!/opt/homebrew/bin/nu

let session = agtermctl tree --json --socket $env.AGT_SOCKET
  | from json
  | get result.tree.workspaces
  | each { $in.sessions }
  | flatten
  | where id == $env.AGT_SESSION_ID
  | first

let pane = if ($session.splitFocused? | default false) { "split" } else { "primary" }
let out = mktemp -t revdiff.XXXXXX

try { 
  (
    agtermctl session overlay open $"/opt/homebrew/bin/revdiff --output ($out)" 
    --block 
    --size-percent 90 
    --target $env.AGT_SESSION_ID 
    --socket $env.AGT_SOCKET 
  )
}

let notes = open --raw $out
rm $out

if ($notes | str trim | is-empty) {
  exit 
}

$notes 
| agtermctl session type --stdin --pane $pane --target $env.AGT_SESSION_ID --socket $env.AGT_SOCKET
