$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

$env.CONFIG_DIR = $env.HOME | path join ".config"
$env.XDG_CONFIG_HOME = $env.CONFIG_DIR

# go
$env.GOPATH = $env.HOME | path join "go"
$env.GOBIN = $env.GOPATH | path join "bin"

# pnpm
$env.PNPM_HOME = "/Users/stefan/Library/pnpm"

$env.BAT_THEME = "ansi"
$env.EDITOR = "nvim"
$env.LESS = "--ignore-case --tabs=4 --tilde --use-color --quit-if-one-screen --raw-control-chars"
$env.MANPAGER = $"sh -c 'col -bx | bat --language man --plain --theme ($env.BAT_THEME)'"
$env.RIPGREP_CONFIG_PATH = $env.HOME | path join ".ripgreprc"
$env.UV_LINK_MODE = "copy" 

$env.PATH ++= [
    "/usr/local/bin",
    "/opt/homebrew/bin",
    "/opt/homebrew/opt/openjdk/bin",
    "/opt/homebrew/opt/node@20/bin",
    $env.GOBIN,
    ($env.HOME | path join ".bun/bin"), # bun
    ($env.HOME | path join ".cargo/bin"), # rust
    $env.PNPM_HOME, # pnpm
]

$env.NU_LIB_DIRS = [
    "~/.nu_scripts" 
]

source-env ~/.config/nushell/scripts/starship.nu
source-env ~/.config/nushell/scripts/carapace.nu
