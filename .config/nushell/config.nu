source-env ~/.config/nushell/default/config.nu

# USER CONFIG

$env.config.show_banner = false
$env.config.filesize.metric = true
$env.config.edit_mode = 'vi'
$env.config.menus = ($env.config.menus | each {|m| $m | update marker '' })
$env.config.rm.always_trash = true
$env.config.table.index_mode = 'always'

$env.config.cursor_shape.vi_insert = 'line'
$env.config.cursor_shape.vi_normal = 'block'

# prevent nushell from setting the tab title to '{cwd} > {process}'
$env.config.shell_integration.osc2 = false

$env.config.history.max_size = 1_000
$env.config.history.file_format = 'sqlite'
$env.config.history.isolation = true

let fnm_hook = {||
    let is_node_dir = ([.node-version .nvmrc] | any { $in | path exists })
    if $is_node_dir {
        fnm use
    }
}

$env.config.hooks.env_change.PWD = (
    $env.config.hooks.env_change.PWD | append [$fnm_hook]
)

let nu_overlays_hook = {||
    let overlays = overlay list | range 1..
    if ($overlays | is-empty) {
        $env.NU_OVERLAYS = null
    } else {
        $env.NU_OVERLAYS = $overlays | str join ", "
    }
}

$env.config.hooks.pre_prompt = (
    $env.config.hooks.pre_prompt | append [$nu_overlays_hook]
)

source ~/.cache/starship/init.nu
source-env ~/.cache/carapace/init.nu

source ~/.config/nushell/scripts/alias.nu
use ~/.config/nushell/scripts/fzf.nu *
use ~/.config/nushell/scripts/net.nu *
use ~/.config/nushell/scripts/goto.nu *
use ~/.config/nushell/scripts/config.nu *

source-env ~/.config/nushell/keymap.nu
