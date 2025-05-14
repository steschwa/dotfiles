$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

$env.CONFIG_DIR = $env.HOME | path join ".config"
$env.XDG_CONFIG_HOME = $env.CONFIG_DIR

# go
$env.GOPATH = $env.HOME | path join "go"
$env.GOBIN = $env.GOPATH | path join "bin"

$env.EDITOR = "nvim"
$env.BAT_THEME = "ansi"
$env.MANPAGER = $"sh -c 'col -bx | bat --language man --plain --theme ($env.BAT_THEME)'"
$env.LESS = "--ignore-case --tabs=4 --tilde --use-color --quit-if-one-screen --raw-control-chars"

$env.UV_LINK_MODE = "copy" 

$env.PATH ++= [
    "/usr/local/bin",
    "/opt/homebrew/bin",
    "/opt/homebrew/opt/openjdk/bin",
    $env.GOBIN,
    ($env.HOME | path join ".bun/bin"), # bun
]

source-env ~/.config/nushell/scripts/starship.nu
source-env ~/.config/nushell/scripts/carapace.nu
source-env ~/.config/nushell/scripts/fnm.nu
