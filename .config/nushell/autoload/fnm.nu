fnm env --json | from json | load-env

$env.PATH = $env.PATH | prepend ($env.FNM_MULTISHELL_PATH | path join 'bin')

$env.config.hooks.env_change.PWD = (
  $env.config.hooks.env_change.PWD? | append {
    condition: {|| 
      ['.nvmrc' '.node-version', 'package.json'] | any { path exists }
    }
    code: {|| 
      (
        fnm use 
        --corepack-enabled 
        --version-file-strategy=recursive 
        --install-if-missing 
        --silent-if-unchanged 
        --resolve-engines
      )
    }
  }
)
