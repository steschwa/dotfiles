fnm env --corepack-enabled --json | from json | load-env

$env.PATH = (
    $env.PATH
    | filter {|it| not ($it | str contains "fnm_multishells") }
    | append ($env.FNM_MULTISHELL_PATH | path join 'bin')
)
