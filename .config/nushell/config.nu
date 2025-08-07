$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

# go
$env.GOPATH = $env.HOME | path join "go"
$env.GOBIN = $env.GOPATH | path join "bin"

# pnpm
$env.PNPM_HOME = $env.HOME | path join "Library/pnpm"

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
    $env.PNPM_HOME,
]

$env.NU_LIB_DIRS = [
    "~/.nu_scripts" 
]

$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.rm.always_trash = true
$env.config.table.index_mode = "always"
$env.config.table.mode = "single"
$env.config.use_kitty_protocol = true

$env.config.cursor_shape.vi_insert = "line"
$env.config.cursor_shape.vi_normal = "block"

# prevent nushell from setting the tab title to "{cwd} > {process}"
$env.config.shell_integration.osc2 = false

$env.config.history.max_size = 1_000
$env.config.history.file_format = "sqlite"
$env.config.history.isolation = true

source ~/.cache/starship/init.nu
source-env ~/.cache/carapace/init.nu

source ~/.config/nushell/scripts/alias.nu
source-env ~/.config/nushell/hooks.nu
source-env ~/.config/nushell/keymap.nu
source-env ~/.config/nushell/scripts/fzf.nu
source ~/.config/nushell/scripts/goto.nu
source ~/.config/nushell/scripts/ansi.nu
source ./scripts/from.nu
source ./scripts/to.nu

use ~/.config/nushell/scripts/net.nu *
