let fzf_opts = [
    "--border=none"
    "--info=hidden"
    "--margin=0"
    "--padding=0,1"
    "--no-scrollbar"
    "--no-separator"
    "--pointer=''"
    "--prompt=' '"
    "--color=fg:gray"
    "--color=bg:-1"
    "--color=hl:yellow"
    "--color=current-fg:-1"
    "--color=current-bg:-1"
    "--color=current-hl:yellow"
    "--color=gutter:-1"
    "--bind=ctrl-y:accept"
]

$env.FZF_DEFAULT_COMMAND = 'fd --type f --hidden'
$env.FZF_DEFAULT_OPTS = ($fzf_opts | str join ' ')
