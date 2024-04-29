fnm env --corepack-enabled --json | from json | load-env
$env.PATH = ($env.PATH | append ($env.FNM_MULTISHELL_PATH | path join 'bin'))
