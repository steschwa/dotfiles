#!/usr/bin/env nu

def main [status: string] {
  if ($env.KITTY_WINDOW_ID? | is-empty) {
    exit 0
  }

  kitten @ set-user-vars --match $'id:($env.KITTY_WINDOW_ID)' $'claude_status=($status)'
}
