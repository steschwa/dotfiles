mkdir ~/.cache/carapace

# https://carapace-sh.github.io/carapace-bin/setup/environment.html#carapace_env
$env.CARAPACE_ENV = 0
carapace _carapace nushell | save -f ~/.cache/carapace/init.nu
