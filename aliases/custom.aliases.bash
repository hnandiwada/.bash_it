export do='--dry-run=client -o yaml'

alias mk=minikube

alias lsa='ls -AF'
alias l='ls -AF'

alias v='vim'
alias vim=nvim

alias ~='cd ~'
alias cdw='cd ~/workspace'
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'

alias tilt='/usr/local/bin/tilt'

alias dockere=docker

alias brewe=brew

alias makee=make

alias venv='deactivate; yarn venv && activate && pip3 install neovim pynvim isort black'
alias activate='source venv/bin/activate'

alias first='tmux new-session -s first'
alias second='tmux new-session -s second -t first'
alias resize='tmux setw -g aggressive-resize on'
