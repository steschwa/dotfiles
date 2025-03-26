use ../themes/rose_pine.nu fzf

let colors = fzf

let fzf_opts = [
    "--border=none"
    "--info=hidden"
    "--margin=0"
    "--padding=0,1"
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
]

$env.FZF_DEFAULT_COMMAND = 'fd --type f --hidden'
$env.FZF_DEFAULT_OPTS = ($fzf_opts | str join ' ')
