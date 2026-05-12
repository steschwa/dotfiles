#!/usr/bin/env nu --config ~/.config/nushell/config.nu

const SEP = '@@@'

let file = git ls-tree -r --name-only HEAD
| lines 
| to text 
| fzf --prompt 'file: '

let logs = git log --follow --format=$'%h($SEP)%cI($SEP)%ae($SEP)%s' -- $file
| lines
| split column $SEP sha date author message
| update date {
  into datetime | format date '%d.%m.%y %R'
}

$logs
| each {|line| 
  [
    $line.sha,
    $line.date,
    $line.author,
    $line.message,
    $'($line.date) ($line.author) [($line.sha)](char newline)($line.message)'
  ]
  | str join $SEP
}
| str join (char nul)
| (
  fzf 
  --read0 
  --delimiter $'($SEP)'
  --with-nth 5 
  --accept-nth $'{1}($SEP){2}($SEP){3}($SEP){4}'
  --gap 
  --gap-line ' ' 
  --prompt 'search history: ' 
  --preview $'git show {1}:($file) | bat --paging=never --color=always --file-name=($file)'
  --bind $"ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up,ctrl-e:execute\(git show {1}:($file) | nvim -R -c 'file ($file)' -c 'filetype detect' -c 'setlocal readonly nomodifiable' -c 'lua vim.diagnostic.enable\(false\)'\)"
)
| split column $SEP sha date author message
| insert file $file
| move --after sha file
| first
