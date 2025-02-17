let fnm_hook = {||
    let is_node_dir = [.node-version .nvmrc] | any { path exists }
    if $is_node_dir {
        fnm use
    }
}

$env.config.hooks.env_change = {
    PWD: [$fnm_hook]
}

let nu_overlays_hook = {||
    let overlays = overlay list | slice 1..
    if ($overlays | is-empty) {
        $env.NU_OVERLAYS = null
    } else {
        $env.NU_OVERLAYS = $overlays | str join ","
    }
}

$env.config.hooks.pre_prompt ++= [$nu_overlays_hook]
