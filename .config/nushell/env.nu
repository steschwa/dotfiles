use std ['path add']

source-env ~/.config/nushell/default/env.nu

# USER CONFIG

$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

$env.PATH = ($env.PATH | split row (char esep))
$env.CONFIG_DIR = ($env.HOME | path join '.config')
$env.XDG_CONFIG_HOME = ($env.HOME | path join '.config')

$env.GOPATH = ($env.HOME | path join 'go')
$env.GOBIN = ($env.GOPATH | path join 'bin')
$env.EDITOR = 'nvim'
$env.MANPAGER = "sh -c 'col -bx | bat -l man -p'"
$env.LESS = "--ignore-case --tilde --mouse --use-color --quit-if-one-screen -R"

path add '/usr/local/bin'
path add '/opt/homebrew/bin'
path add '/opt/homebrew/opt/openjdk/bin'
path add $env.GOBIN

source-env ~/.config/nushell/scripts/starship.nu
source ~/.config/nushell/scripts/carapace.nu
source-env ~/.config/nushell/scripts/fnm.nu
