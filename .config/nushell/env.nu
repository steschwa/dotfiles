$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

# $env.PATH = ($env.PATH | split row (char esep))
$env.CONFIG_DIR = ($env.HOME | path join '.config')
$env.XDG_CONFIG_HOME = ($env.HOME | path join '.config')

$env.GOPATH = ($env.HOME | path join 'go')
$env.GOBIN = ($env.GOPATH | path join 'bin')
$env.EDITOR = 'nvim'
$env.MANPAGER = "sh -c 'col -bx | bat -l man -p'"
$env.LESS = "--ignore-case --tabs=4 --tilde --use-color --quit-if-one-screen --raw-control-chars"

$env.PATH ++= [
    "/usr/local/bin",
    "/opt/homebrew/bin",
    "/opt/homebrew/opt/openjdk/bin",
    $env.GOBIN
]

source-env ~/.config/nushell/scripts/starship.nu
source ~/.config/nushell/scripts/carapace.nu
source-env ~/.config/nushell/scripts/fnm.nu
