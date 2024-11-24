export def "config diff" [
    type: string@diff_type
] {
    let default_config = (get_default_config $type)
    let default_config_path = (get_default_config_path $type)

    let temp_default_config_path = $'/tmp/(random chars)'

    $default_config | save -f $temp_default_config_path

    diff -u $default_config_path $temp_default_config_path | bat -l diff
}

export def "config upgrade" [
    type: string@diff_type
] {
    get_default_config $type | save -f (get_default_config_path $type)
}

def get_default_config [
    type: string@diff_type
] {
    match $type {
        "env" => (config env --default)
        "nu" => (config nu --default)
    }
}

def get_default_config_path [
    type: string@diff_type
] {
    match $type {
        "env" => ('~/.config/nushell/default/env.nu' | path expand)
        "nu" => ('~/.config/nushell/default/config.nu' | path expand)
    }
}

def diff_type [] { ["env", "nu"] }
