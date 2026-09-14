#!/opt/homebrew/bin/nu

let picked = agtermctl tree --json --socket $env.AGT_SOCKET
  | from json
  | get result.tree.workspaces
  | each { 
    { 
      id: $in.id,
      label: $in.name 
    } 
  }
  | to json
  | agtermctl pick --prompt "Workspace" --socket $env.AGT_SOCKET
  | complete

# exit 2 is cancel
if $picked.exit_code == 0 {
  let workspace_id = $picked.stdout | from json | get id
  agtermctl workspace select --target $workspace_id --socket $env.AGT_SOCKET
}
