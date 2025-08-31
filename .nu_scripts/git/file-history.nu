#!/usr/bin/env nu --config ~/.config/nushell/config.nu

export def main [
    $path: string
] {
    if not ($path | path exists) {
        error make { msg: $"($path) does not exist" }
    }

    let top_level = git rev-parse --show-toplevel
    let path_rel = $path | path relative-to $top_level
    let extension = $path | path parse | get extension

    let changes = git log -z --pretty=format:"%H [%cd] %ae%n%s" --date=format:"%d.%m.%y %H:%M" -- $path_rel

    $changes
    | (
        fzf 
        --read0
        --with-nth "2.." 
        --no-input 
        --padding 0 
        --gap 1
        --gap-line "─"
        --pointer "▌"
        --no-sort
        --color "preview-fg:-1,pointer:3,border:0" 
        --bind "q:abort,j:down,k:up,d:preview-half-page-down,u:preview-half-page-up" 
        --bind "focus:transform-preview-label:echo {2..3} {1}"
        --preview $"git show {1}:($path_rel) | bat --language ($extension) --color always"
        --preview-border sharp 
        --footer $path_rel
        --footer-border sharp
    )
}
