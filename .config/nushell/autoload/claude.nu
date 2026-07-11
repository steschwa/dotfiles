def --wrapped claude [...rest] {
    with-env {
        CLAUDE_CODE_DISABLE_TERMINAL_TITLE: 1
    } {
        caffeinate -s claude ...$rest
    }
}
