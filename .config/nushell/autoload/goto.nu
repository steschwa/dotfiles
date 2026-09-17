def --env goto [] {
    let dirs = [
      ...(_subdirs "/Users/stefan/projects"),
      ...(_subdirs "/Users/stefan/.config"),
    ]

    let selection = $dirs | to text | fzf --prompt='goto directory: '
    if ($selection | is-empty) {
      return
    }

    let title = $selection | path basename

    cd $selection
    print --no-newline $"(ansi title)($title)(ansi st)" 
    clear
}

def _subdirs [root: string]: nothing -> list<string> {
  ls $root | where type == "dir" | get name
}
