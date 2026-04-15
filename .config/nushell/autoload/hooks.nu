let nu_overlays_hook = {||
    let overlays = overlay list | where active == true and name != 'zero' 
    if ($overlays | is-empty) {
        $env.NU_OVERLAYS = null
    } else {
        $env.NU_OVERLAYS = $overlays | get name | str join ','
    }
}

def is_reonic_dir [
    dir?: string
] {
    if ($dir | is-empty) {
        return false
    }

    $dir | path parse | get stem | str starts-with 'reonic'
}

let reonic_overlay_activate_hook = {
    condition: {|_, after|
        is_reonic_dir $after
    }
    code: 'overlay use -p reonic'
}
let reonic_overlay_hide_hook = {
    condition: {|before, after|
        (is_reonic_dir $before) and not (is_reonic_dir $after) and ('reonic' in (overlay list).name)
    }
    code: 'overlay hide --keep-env [ PWD ] reonic'
}

$env.config.hooks.pre_prompt ++= [$nu_overlays_hook]
$env.config.hooks.env_change = {
    PWD: [$reonic_overlay_activate_hook, $reonic_overlay_hide_hook]
}
