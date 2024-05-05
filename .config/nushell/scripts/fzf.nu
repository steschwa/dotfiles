export-env {
    let fzf_opts = [
        "--preview='bat --color=always --style=numbers --theme=Nord {}'"
        "--border=none"
        "--info=hidden"
        "--margin=0"
        "--padding=0"
        "--no-scrollbar"
        "--no-separator"
        "--pointer='󰅂'"
        "--prompt='󰄾 '"
        "--color=bg:-1"
        $"--color=fg:($env.COLORS.nord.snow_storm.nord4)"
        $"--color=hl:($env.COLORS.nord.frost.nord8)"
        $"--color=fg+:($env.COLORS.nord.snow_storm.nord6)"
        $"--color=bg+:($env.COLORS.nord.polar_night.nord1)"
        $"--color=hl+:($env.COLORS.nord.frost.nord8)"
        $"--color=prompt:($env.COLORS.nord.aurora.nord15)"
        $"--color=pointer:($env.COLORS.nord.aurora.nord14)"
        "--color=gutter:-1"
        "--bind 'start:hide-preview'"
        "--bind 'ctrl-p:toggle-preview'"
        "--bind 'ctrl-e:execute(nvim {})'"
        "--bind 'ctrl-d:preview-half-page-down'"
        "--bind 'ctrl-u:preview-half-page-up'"
    ]

    $env.FZF_DEFAULT_COMMAND = 'fd --type f --hidden'
    $env.FZF_DEFAULT_OPTS = ($fzf_opts | str join ' ')
}
