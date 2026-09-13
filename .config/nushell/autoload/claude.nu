def --wrapped claude [...rest] {
  with-env {
    CLAUDE_CODE_DISABLE_TERMINAL_TITLE: 1
  } {
    if ($env.AGTERM_ENABLED? | is-not-empty) {
      agtermctl session rename --target $env.AGTERM_SESSION_ID ai
    }
    
    try {
      caffeinate -s claude ...$rest
    } finally {
      if ($env.KITTY_WINDOW_ID? | is-not-empty) {
        kitten @ set-user-vars --match $'id:($env.KITTY_WINDOW_ID)' claude-status
      }
    }
  }
}
