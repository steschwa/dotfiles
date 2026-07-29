def --wrapped claude [...rest] {
  with-env {
    CLAUDE_CODE_DISABLE_TERMINAL_TITLE: 1
  } {
    try {
      caffeinate -s claude ...$rest
    } finally {
      kitten @ set-user-vars claude-status
    }
  }
}
