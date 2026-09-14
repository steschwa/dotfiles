def --wrapped claude [...rest] {
  with-env {
    CLAUDE_CODE_DISABLE_TERMINAL_TITLE: 1
  } {
    try {
      caffeinate -s claude ...$rest
    } finally {
      if ($env.KITTY_WINDOW_ID? | is-not-empty) {
        kitten @ set-user-vars --match $'id:($env.KITTY_WINDOW_ID)' claude-status
      }
    }
  }
}
