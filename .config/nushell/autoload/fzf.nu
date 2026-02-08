let fzf_opts = [
    "--border=none",
    "--info=hidden",
    "--margin=0",
    "--padding=1",
    "--no-scrollbar",
    "--no-separator",
    "--pointer=''",
    "--prompt=' '",
    "--color=fg:gray,fg+:-1,bg:-1,bg+:-1,hl:6,hl+:-1,gutter:-1,prompt:2",
    "--bind=ctrl-y:accept",
    "--marker=''",
    "--reverse",
    "--separator=' '"
]

$env.FZF_DEFAULT_COMMAND = 'fd --type f --hidden'
$env.FZF_DEFAULT_OPTS = ($fzf_opts | str join ' ')
