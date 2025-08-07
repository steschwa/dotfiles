$env.STARSHIP_SHELL = "nu"
$env.STARSHIP_CONFIG = ($env.XDG_CONFIG_HOME | path join "starship/starship.toml")

mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
