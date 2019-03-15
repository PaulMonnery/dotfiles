#!/bin/bash

  files="./.files"
  dir_tmp="/tmp/install"
  login=$1
  EPITECH_LOGIN=paul.monnery
  fake=0
  ESC="\033["
  C_RED=$ESC"0;31m"
  C_YELLOW=$ESC"0;33m"
  C_BWHITE=$ESC"1;37m"
  C_RST=$ESC"0m"

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

function handle_error
{
  result=$1
  if test $result -eq 0; then
    return
  else
    echo -en $C_RED"[Erreur]"$C_RST" lors de l'installation, voulez-vous arreter le script ? [O/n]  "
    read stop_script
    case $stop_script in
      n|N)  return;;
      *)    exit 1;;
    esac
  fi
}

function get_os_type
{
  which zypper &> /dev/null && os="opensuse"
  which pacman &> /dev/null && os="archlinux"
  which dnf &> /dev/null && os="fedora"
  which apt-get &> /dev/null && os="debian"
  which emerge &> /dev/null && os="gentoo"
}

function script_init
{
  os="void"
  get_os_type

  if test "$os" = "void"; then
    echo "VOTRE DISTRIBUTION N'EST PAS SUPPORTÉE..."
    exit 42
  fi

  rm -rf $dir_tmp
  mkdir $dir_tmp
}

function sys_upgrade
{
  if test $fake -eq 1; then
    echo "Upgrade system"
    return
  fi
  case "$os" in
    opensuse)
      sudo zypper -y update
      ;;
    archlinux)
      sudo pacman --noconfirm -Syu
      ;;
    fedora)
      sudo dnf -y update
      ;;
    debian)
      sudo apt-get -y update; sudo apt-get -y upgrade
      ;;
    gentoo)
      sudo emerge -u world
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

git clone https://github.com/PaulMonnery/installation_script.git

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
if [[ $REPLY =~ ^[Yy]$ ]]
then
  curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh > oh-my-zsh.sh
  sed -i "s/env zsh/exit/g" oh-my-zsh.sh
  chmod 755 oh-my-zsh.sh
  ./oh-my-zsh.sh
  rm oh-my-zsh.sh

  echo
  read -p "${YELLOW}Importing zsh configuration's files? (requires openssl's decrypt's password) [n]${NORMAL} " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    openssl enc -d -aes-256-cbc -in installation_script/dotfiles/.zshrc -out ~/.zshrc
    openssl enc -d -aes-256-cbc -in installation_script/dotfiles/.zsh_history -out ~/.zsh_rc
    yes | cp -rfv installation_script/dotfiles/.gitconfig ~
    yes | cp -rfv installation_script/dotfiles/sunaku-zen.zsh-theme ~/.oh-my-zsh/themes
    sed -i "s/pmonnery/$USER/g" ~/.zshrc
    handle_error $?
  fi
fi

echo
read -p "${YELLOW}copying personnal emacs's configuration? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  tar -zxvf installation_script/dotfiles/.emacs.d.tgz
  mv .emacs.d installation_script/dotfiles
  yes | cp -rf installation_script/dotfiles/.emacs.d ~
  yes | cp -rfv installation_script/dotfiles/.emacs ~
  handle_error $?
fi

echo
read -p "${YELLOW}geneating ssh key and blih? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  ssh-keygen
  sudo cp installation_script/scripts/blih /usr/bin/blih
  handle_error $?
  sudo chmod 755 /usr/bin/blih
  handle_error $?
fi

echo
read -p "${YELLOW}uploading ssh key? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  blih -u $EPITECH_LOGIN@epitech.eu sshkey upload ~/.ssh/id_rsa.pub
  handle_error $?
fi

echo
read -p "${YELLOW}updating packages? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sys_upgrade
  handle_error $?
fi

echo
read -p "${YELLOW}download tek1 projets? [y/n]${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    mkdir ~/Delivery/tek2 -vp
    cd ~/Delivery
    wget 176.185.206.214:3000/files/tek1.tgz
    tar -zxvf tek1.tgz
    rm -fr tek1.tgz
    handle_error $?
fi

echo
read "${YELLOW}You can now use zsh${NORMAL}\n"