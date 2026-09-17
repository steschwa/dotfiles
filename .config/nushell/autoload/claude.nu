def --wrapped claude [...rest] {
  print --no-newline $"(ansi title)ai(char bel)"

  let is_reonic_dir = pwd | path parse | get stem | str starts-with 'reonic'
  let flags = if $is_reonic_dir {
    ['--add-dir' ($nu.home-dir | path join '.config' 'reonic')]
  } else {
    []
  }

  with-env {
    CLAUDE_CODE_DISABLE_TERMINAL_TITLE: 1
  } {
    caffeinate -s claude ...$flags ...$rest
  }
}
