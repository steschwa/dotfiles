alias v = nvim
alias vim = nvim
alias python = python3
alias copy = pbcopy
alias paste = pbpaste
alias bat = bat --theme=base16 --style numbers
alias tree = tree --gitignore -C

# git
alias gs = git status
alias gd = git diff HEAD
alias gc = git commit -m

# yadm
alias yup = yadm commit -m 'build(nvim): update plugins'
alias yc = yadm commit -m
alias ys = yadm status

alias cd.. = cd ..
alias .. = cd ..
alias cdl = cd ~/Downloads

alias d = docker
alias dcup = docker compose up -d
alias dcdown = docker compose down

alias isup = ping 1.1

alias jq = jq --indent 4

alias http = python3 -m http.server 8080 --bind 127.0.0.1
