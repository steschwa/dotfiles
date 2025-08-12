# -------------------------------------------
# ENV
# -------------------------------------------

$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

# go
$env.GOPATH = $env.HOME | path join "go"
$env.GOBIN = $env.GOPATH | path join "bin"

# pnpm
$env.PNPM_HOME = $env.HOME | path join "Library/pnpm"

# starship
$env.STARSHIP_SHELL = "nu"
$env.STARSHIP_CONFIG = ($env.XDG_CONFIG_HOME | path join "starship/starship.toml")

# carapace
$env.CARAPACE_ENV = 0

$env.BAT_THEME = "ansi"
$env.EDITOR = "nvim"
$env.LESS = "--ignore-case --tabs=4 --tilde --use-color --quit-if-one-screen --raw-control-chars"
$env.MANPAGER = $"sh -c 'col -bx | bat --language man --plain --theme ($env.BAT_THEME)'"
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

# -------------------------------------------
# CONFIG
# -------------------------------------------

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

# -------------------------------------------
# STARSHIP
# -------------------------------------------

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

# -------------------------------------------
# CARAPACE
# -------------------------------------------

mkdir ~/.cache/carapace
carapace _carapace nushell | save -f ~/.cache/carapace/init.nu
