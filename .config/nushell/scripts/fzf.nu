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
        "--pointer='󰅂'"
        "--prompt='󰄾 '"
        "--color=bg:-1"
        $"--color=fg:($colors.fg)"
        $"--color=hl:($colors.hl)"
        $"--color=fg+:($colors.fg_line)"
        $"--color=bg+:($colors.bg_line)"
        $"--color=hl+:($colors.hl_line)"
        $"--color=prompt:($colors.prompt)"
        $"--color=pointer:($colors.pointer)"
        "--color=gutter:-1"
        "--preview='bat --color=always --style=numbers --theme=Nord {}'"
        "--bind 'start:hide-preview'"
        "--bind 'ctrl-p:toggle-preview'"
        "--bind 'ctrl-e:execute(nvim {})'"
        "--bind 'ctrl-d:preview-half-page-down'"
        "--bind 'ctrl-u:preview-half-page-up'"
    ]

    $env.FZF_DEFAULT_COMMAND = 'fd --type f --hidden'
    $env.FZF_DEFAULT_OPTS = ($fzf_opts | str join ' ')
}
