#functions
zsh$ gclone() {git clone git@git.epitech.eu:/paul.monnery@epitech.eu/"$1" ; cd "$1"}
zsh$ gitclone() {git clone git@git.epitech.eu:/"$1"@epitech.eu/"$2" ; cd "$2"}
zsh$ rename() {for foo in *."$1"; do mv $foo `basename $foo ."$1"`."$2"; done}
zsh$ tarc() {tar -zcvf "$1".tgz "$1"}
zsh$ rdm () {pandoc "$1" | lynx -stdin}

#git
alias pull='git pull'
alias push='git push'
alias swi='git checkout'
alias push_branch='git push --set-upstream origin'
alias commit='git commit -m'
alias dev='git checkout dev'
alias master='git checkout master'
alias merge='git merge'
alias branch='git branch'
alias slog='git shortlog'
alias stash='git stash'
alias stasha='git stash apply'
alias repartition="git ls-files | xargs -n1 git blame --line-porcelain | sed -n 's/^author //p' | sort -f | uniq -ic | sort -nr"

#utils
alias see='subl'
alias size='du -sh'
alias sn="sudo nano"
alias lsc='clear; ls'
alias open="xdg-open"
alias del='trash-put'
alias yas="yarn start"
alias untar='tar -zxvf'
alias sdn='init 0'
alias ss="source ~/.zshrc"
alias ctl="sudo systemctl"
alias norm='norminette -luAi4'
alias PS='wine /opt/photoshop/Photoshop.exe'
alias zshrc='emacs -nw ~/.zshrc && source ~/.zshrc'
alias folder_pull='ls | xargs -P10 -I{} git -C {} pull'
alias myip="ip a | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'percentage:'"
alias phone='~/.Android/emulator/emulator -avd Pixel_3_API_27 -netdelay none -netspeed full &'
alias term_start='xdotool key F11 ctrl+shift+e ctrl+shift+o'
alias speedtest="curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -"
alias xat='bat --decorations never'
alias len="xclip -o | wc -c"
alias t="tree"
alias lz="sudo lazydocker"
alias tek="cd /home/pmonnery/Delivery/tek2"
alias cs="cd \`fd -H -t d . | fzf\`"
alias fe='emacs -nw $(fzf)'

#youtube
alias yt-dl='youtube-dl --no-playlist --restrict-filenames --audio-quality 0 --extract-audio --audio-format mp3 --exec '\''mv {} ~/Downloads/'\'
alias yt-dl-mp4='youtube-dl --no-playlist --restrict-filenames --audio-quality 0 --format mp4 --exec '\''mv {} ~/Downloads/'\'
alias yt-dl-list='youtube-dl --restrict-filenames --audio-quality 0 --extract-audio --audio-format mp3 --exec '\''mv {} ~/Downloads/'\'
alias yt-dl-list-mp4='youtube-dl --restrict-filenames --audio-quality 0 --format mp4 --exec '\''mv {} ~/Downloads/'\'

#package manager
alias install='sudo dnf install'
alias remove='sudo dnf remove'
alias upgrade='sudo dnf upgrade'

#vpn
alias vpn='nordvpn'
alias vpnc='nordvpn connect'
alias vpnd='nordvpn disconnect'

#manipulation
alias rm='rm -iv'
alias rrm='rm -Rf'
alias rrrm='sudo rm -Rf'
alias cp='cp -iv'
alias ccp='cp -R'
alias mv='mv -iv'
alias ne='emacs -nw'
alias pg='ping google.com'
alias clean="find -name '#*#' -print -delete -o -name '*~' -print -delete -o -name '*.o' -print -delete -o -name 'a.out' -print -delete -o -name 'vgcore.*' -print -delete"
alias cx='chmod +x'

# compilation
alias m='make'
alias re='make re'
alias de='make debug'
alias f="make fclean"
alias va='valgrind'
alias valeak='valgrind --leak-check=full --show-leak-kinds=all'
alias gpp="g++ -Wall -Wextra"

#docker
alias mouli='sudo docker run --net=host --rm -it -v $PWD:/home/ -w /home -e DISPLAY=:0 epitechcontent/epitest-docker zsh'
alias dsa="sudo docker start"
alias dso="sudo docker stop"
alias dls="sudo docker container ls"

#exports
export EDITOR="emacs -nw"
export QT_LOGGING_RULES='*=false'
export GOPATH=$HOME/.go
export ANDROID_HOME=$HOME/.Android

export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.local/bin

export GEM_PATH=/home/pmonnery/.local/bin
export GEM_HOME=/home/pmonnery/.local/bin

export NLTK_DATA=$HOME/.nltk_data
export FZF_DEFAULT_OPTS='--height 30% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f -H'
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#zsh
export ZSH="/home/pmonnery/.oh-my-zsh"
ZSH_THEME="sunaku-zen"
plugins=(git web-search zsh-completions zsh-autosuggestions)
autoload -U compinit && compinit
source $ZSH/oh-my-zsh.sh


alias ls="exa"
alias LS="/bin/ls --color=auto"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"