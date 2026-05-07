#!/usr/bin/env bash

if [[ -n "${TMUX_PANE:-}" ]]; then
    tmux set-option --window --target "${TMUX_PANE}" @claude_status "$1"
fi
