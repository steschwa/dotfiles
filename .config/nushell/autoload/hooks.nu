let nu_overlays_hook = {||
    let overlays = overlay list | where active == true and name != "zero" 
    if ($overlays | is-empty) {
        $env.NU_OVERLAYS = null
    } else {
        $env.NU_OVERLAYS = $overlays | get name | str join ","
    }
}

$env.config.hooks.pre_prompt ++= [$nu_overlays_hook]
