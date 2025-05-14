#!/usr/bin/env nu

# ---------------------------
# REQUIREMENTS:
# 1. Rust Toolchain: see https://www.rust-lang.org/tools/install
# 2. pake-cli: bun install --global pake-cli
# ---------------------------

const icon_path = path self . | path join "pake-icon.icns"

pake http://localhost:3210 --name LobeChat --dark-mode --icon $icon_path
