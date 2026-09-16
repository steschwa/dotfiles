def --wrapped claude [...rest] {
  print --no-newline $"(ansi title)ai(char bel)"

  with-env {
    CLAUDE_CODE_DISABLE_TERMINAL_TITLE: 1
  } {
    caffeinate -s claude ...$rest
  }
}
