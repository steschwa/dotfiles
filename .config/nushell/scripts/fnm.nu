fnm env --corepack-enabled --json | from json | load-env

# note to self:
# for some reason it may happen that $env.PATH contains two fnm multishell paths.
# this prevents the later path (the correct path) to never get searched for binaries (e.g. node or npm).
# usually quitting and reopening the entire terminal fixes that 🤷

$env.PATH ++= [
    ($env.FNM_MULTISHELL_PATH | path join 'bin')
]
