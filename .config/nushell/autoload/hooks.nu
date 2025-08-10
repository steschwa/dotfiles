let nu_overlays_hook = {||
    let overlays = overlay list | slice 1..
    if ($overlays | is-empty) {
        $env.NU_OVERLAYS = null
    } else {
        $env.NU_OVERLAYS = $overlays | str join ","
    }
}

$env.config.hooks.pre_prompt ++= [$nu_overlays_hook]
