function tarc() {tar -zcvf "$1".tgz "$1"}
function zipc() {zip "$1".tgz "$1"}
function testing() {FOLDER=$(mktemp -d) && git clone $1 $FOLDER && code $FOLDER}
function dclog() {dc logs --no-color -f $1 2>&1 | sed 's/^[^ ]*  *| //'}

# git
alias pull='git pull'
alias push='git push'
alias pushu='git push --set-upstream origin `git rev-parse --abbrev-ref HEAD`'
alias swi='git checkout'
alias commit='git commit -m'
alias dev='git checkout develop'
alias master='git checkout master'
alias merge='git merge'
alias slog='git shortlog'
alias stash='git stash --include-untracked'
alias stasha='git stash apply'
alias stashp='git stash pop'
alias repartition="git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"

# manipulation
alias del='rm -fr'
alias rm='rm -iv'
alias rrm='rm -rf'
alias rrrm='sudo rm -rf'
alias cp='cp -iv'
alias ccp='cp -ivr'
alias mv='mv -iv'
alias cx='chmod +x'

# utils
alias size='du -sh'
alias sn="sudo nano"
alias ne='emacs -nw'
alias yas="yarn start"
alias untar='tar -zxvf'
alias sdn='init 0'
alias ss="source ~/.zshrc"
alias ctl="sudo systemctl"
alias zshrc='code ~/.zshrc'
alias folder_pull='ls | xargs -P10 -I{} git -C {} pull'
alias myip="ip a | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias pg='ping google.com'
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -"
alias xat='bat --decorations never'
alias t="exa --tree"
alias lz="lazydocker"
alias cs="cd && cd \`fd -H -t d . | fzf\`"
alias pipi="python3 -m pip install --user"
alias dc="docker-compose"
alias peotry="poetry"

# windows
alias open="explorer.exe"
alias powershell="powershell.exe"

# package manager
alias install='sudo apt install'
alias remove='sudo apt remove'
alias upgrade='sudo apt update && sudo apt upgrade'

# ssh
alias sshserv="ssh -i ~/.ssh/server_key paul@polflix.fr"
alias sshservlocal="ssh -i ~/.ssh/server_key paul@192.168.1.47"

#  compilation
alias m='make'
alias re='make re'
alias f="make fclean"

# heroku
alias hlog="heroku logs --tail --num 10000"
alias hvars="heroku config"
alias hvar="heroku config:get"
alias hvarset="heroku config:set"

# docker
alias mouli='docker run --net=host --rm -it -v $PWD:/home/ -w /home -e DISPLAY=:0 epitechcontent/epitest-docker zsh'
alias dsa="docker start"
alias dso="docker stop"
alias dls="docker container ls"

# exports
export wh="/mnt/c/Users/Paul/"
export EDITOR="nano"

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

export PATH=$PATH:$HOME/.local/bin
export PATH=$HOME/.poetry/bin:$PATH

# export ELECTRON_TRASH=gio
# export FLYCTL_INSTALL="$HOME/.fly"
# export PATH="$FLYCTL_INSTALL/bin:$PATH"

# zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  web-search
  poetry
  asdf
  colored-man-pages
  zsh-autosuggestions
  zsh-completions
)
autoload -U compinit && compinit
eval "$(direnv hook zsh)"

# fzf
export FZF_DEFAULT_OPTS='--height 30% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f -H'
source $ZSH/oh-my-zsh.sh
source $HOME/.asdf/asdf.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/home/pmonnery/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

alias ls="exa"

# remove PATH duplicates
PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

# unused
# alias airplay="uxplay & ; xdotool selectwindow set_window --name 'ux'; fg"
# alias nrun="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"
# alias ntop="watch -n 1 nvidia-smi"
# alias clean="find -name '#*#' -print -delete -o -name '*~' -print -delete -o -name '*.o' -print -delete -o -name 'a.out' -print -delete -o -name 'vgcore.*' -print -delete"
# alias ccode="code .vscode/*.code-workspace"
# alias mr="cd ~/delivery/ramify/monorepo && ccode"
# alias len="xclip -o | wc -c"
# alias fe='nano -nw $(fzf)'
# alias bat='batcat'
