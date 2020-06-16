#!/bin/bash

files="./.files"
dir_tmp="/tmp/install"
login=$1
EPITECH_LOGIN=paul.monnery
fake=0

if which tput >/dev/null 2>&1; then
  ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi

#########################################################################################################

function handle_error() {
  result=$1
  if test $result -eq 0; then
    return
  else
    echo -en "$RED[Erreur]$NORMAL lors de l'installation, voulez-vous arreter le script ? [O/n]  "
    read stop_script
    case $stop_script in
    n | N) return ;;
    *) exit 1 ;;
    esac
  fi
}

function get_os_type() {
  which zypper &>/dev/null && os="opensuse"
  which pacman &>/dev/null && os="archlinux"
  which dnf &>/dev/null && os="fedora"
  which apt-get &>/dev/null && os="debian"
  which emerge &>/dev/null && os="gentoo"
}

function script_init() {
  os="void"
  get_os_type

  if test "$os" = "void"; then
    echo "VOTRE DISTRIBUTION N'EST PAS SUPPORTÉE..."
    exit 42
  fi

  rm -rf $dir_tmp
  mkdir $dir_tmp
}

function sys_upgrade() {
  if test $fake -eq 1; then
    echo "Upgrade system"
    return
  fi
  case "$os" in
  archlinux)
    sudo pacman --noconfirm -Syu
    ;;
  fedora)
    sudo dnf -y update
    ;;
  debian)
    sudo apt-get -y update
    sudo apt-get -y upgrade
    ;;
  esac
  handle_error $?
}

if test $UID -eq 0; then
  echo ">> Ne pas lancer ce script en tant que sudo <<"
  usage
  exit 1
fi

script_init

#########################################################################################################

git clone https://github.com/PaulMonnery/dotfiles.git

read -p "${YELLOW}Is you epitech login ${GREEN}$EPITECH_LOGIN${YELLOW} ? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Nn]$ ]]; then
  while [ true ]; do
    echo
    read -p "${YELLOW}Enter you epitech login (firstname.lastname)${GREEN} " EPITECH_LOGIN
    echo
    read -p "$EPITECH_LOGIN@epitech.eu${YELLOW} is correct? [y/n]${NORMAL} " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      break
    fi
  done
fi

echo
read -p "${YELLOW}installing oh-my-zsh? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
    echo "Could not install Oh My Zsh" >/dev/stderr
  }
  echo
  read -p "${YELLOW}Importing zsh configuration's files? (requires openssl's decrypt's password) [n]${NORMAL} " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    openssl enc -d -aes-256-cbc -in dotfiles/dotfiles/.zsh_history -out ~/.zsh_history
    yes | cp -rfv dotfiles/dotfiles/.gitconfig ~
    yes | cp -rfv dotfiles/dotfiles/.gitignore ~
    yes | cp -rfv dotfiles/dotfiles/.zshrc ~
    yes | cp -rfv dotfiles/dotfiles/.fzf.zsh ~
    yes | cp -rfv dotfiles/dotfiles/.yarnrc ~
    curl https://raw.githubusercontent.com/AffanIndo/sunaku-zen/master/sunaku-zen.zsh-theme > ~/.oh-my-zsh/themes/sunaku-zen.zsh-theme
    sed -i "s/pmonnery/$USER/g" ~/.zshrc
  fi
fi

echo
read -p "${YELLOW}copying emacs personnal configuration? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  tar -zxvf dotfiles/dotfiles/.emacs.d.tgz
  mv .emacs.d dotfiles/dotfiles
  yes | cp -rf dotfiles/dotfiles/.emacs.d ~
  yes | cp -rfv dotfiles/dotfiles/.emacs ~
  handle_error $?
fi

echo
read -p "${YELLOW}geneating ssh key and blih? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  ssh-keygen
  curl https://raw.githubusercontent.com/Epitech/dump/master/blih.py > dotfiles/scripts/blih
  sudo cp dotfiles/scripts/blih /usr/bin/blih
  handle_error $?
  sudo chmod 755 /usr/bin/blih
  handle_error $?
fi

echo
read -p "${YELLOW}uploading ssh key? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  blih -u $EPITECH_LOGIN@epitech.eu sshkey upload ~/.ssh/id_rsa.pub
  handle_error $?
fi

echo
read -p "${YELLOW}updating packages? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sys_upgrade
  handle_error $?
fi

echo
read -p "${YELLOW}You can now use zsh${NORMAL} " -n 1 -r