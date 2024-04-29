$env.STARSHIP_SHELL = 'nu'
$env.STARSHIP_CONFIG = ($env.CONFIG_DIR | path join 'starship' 'starship.toml')

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
