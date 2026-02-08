let fzf_opts = [
    "--border=none",
    "--info=hidden",
    "--margin=0",
    "--padding=1",
    "--no-scrollbar",
    "--no-separator",
    "--pointer=''",
    "--prompt=' '",
    "--color=fg:gray,bg:-1,hl:6,current-fg:-1,current-bg:-1,current-hl:6,gutter:-1,prompt:2",
    "--bind=ctrl-y:accept",
    "--marker=''",
    "--reverse",
    "--separator=' '"
]

$env.FZF_DEFAULT_COMMAND = 'fd --type f --hidden'
$env.FZF_DEFAULT_OPTS = ($fzf_opts | str join ' ')
