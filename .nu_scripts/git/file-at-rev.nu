#!/usr/bin/env nu --config ~/.config/nushell/config.nu

export def main [] {
    let remotes = git remote | lines

    let branch = git branch --all --format '%(refname:short)' 
    | lines 
    | where $it not-in $remotes
    | to text
    | fzf --prompt 'branch: '

    let file = git ls-tree -r --name-only $branch 
    | lines 
    | to text 
    | fzf --prompt 'file: '

    git show $'($branch):($file)' | bat --file-name $file
}
