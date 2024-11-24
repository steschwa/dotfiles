source-env ~/.config/nushell/default/config.nu

# USER CONFIG

$env.config.show_banner = false
$env.config.filesize.metric = true
$env.config.edit_mode = 'vi'
$env.config.menus = ($env.config.menus | each { update marker '' })
$env.config.rm.always_trash = true
$env.config.table.index_mode = 'always'

$env.config.cursor_shape.vi_insert = 'line'
$env.config.cursor_shape.vi_normal = 'block'

# prevent nushell from setting the tab title to '{cwd} > {process}'
$env.config.shell_integration.osc2 = false

$env.config.history.max_size = 1_000
$env.config.history.file_format = 'sqlite'
$env.config.history.isolation = true

source ~/.cache/starship/init.nu
source-env ~/.cache/carapace/init.nu

source ~/.config/nushell/scripts/alias.nu
use ~/.config/nushell/scripts/fzf.nu *
use ~/.config/nushell/scripts/net.nu *
use ~/.config/nushell/scripts/goto.nu *
use ~/.config/nushell/scripts/config.nu *
use ~/.config/nushell/scripts/init.nu *

source-env ~/.config/nushell/hooks.nu
source-env ~/.config/nushell/keymap.nu
