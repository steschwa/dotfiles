export-env {
    use ../themes/rose_pine.nu fzf

    let colors = (fzf)

    let fzf_opts = [
        "--border=none"
        "--info=hidden"
        "--margin=0"
        "--padding=0"
        "--no-scrollbar"
        "--no-separator"
        "--color=bg:-1"
        "--pointer=''"
        "--prompt=' '"
        $"--color=fg:($colors.fg)"
        $"--color=hl:($colors.hl)"
        $"--color=current-fg:($colors.fg_line)"
        $"--color=current-bg:($colors.bg_line)"
        $"--color=current-hl:($colors.hl_line)"
        $"--color=prompt:($colors.prompt)"
        $"--color=pointer:($colors.pointer)"
        "--color=gutter:-1"
        "--preview='bat --color=always --style=numbers --theme=base16 {}'"
        "--bind 'start:hide-preview'"
        "--bind 'ctrl-p:toggle-preview'"
        "--bind 'ctrl-e:execute(nvim {})'"
        "--bind 'ctrl-d:preview-half-page-down'"
        "--bind 'ctrl-u:preview-half-page-up'"
    ]

    $env.FZF_DEFAULT_COMMAND = 'fd --type f --hidden'
    $env.FZF_DEFAULT_OPTS = ($fzf_opts | str join ' ')
}
