def --wrapped claude [...rest] {
    let claude_config_dir = (
        if (pwd) =~ '/reonic-?' {
            [$env.HOME, '.claude-reonic'] | path join
        } else {
            [$env.HOME, '.claude'] | path join
        }
    )

    with-env { CLAUDE_CONFIG_DIR: $claude_config_dir } {
        ^claude ...$rest
    }
}
