#!/bin/bash

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
BOLD="$(tput bold)"
NORMAL="$(tput sgr0)"

read -p "${YELLOW}Is Visual Studio Code installed?${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  code --install-extensi 13xforever.language-x86-64-assembly
  code --install-extensi aaron-bond.better-comments
  code --install-extensi albymor.increment-selection
  code --install-extensi austin.code-gnu-global
  code --install-extensi dbaeumer.vscode-eslint
  code --install-extensi eamodio.gitlens
  code --install-extensi ecmel.vscode-html-css
  code --install-extensi foxundermoon.shell-format
  code --install-extensi gerane.Theme-FlatlandMonokai
  code --install-extensi justusadam.language-haskell
  code --install-extensi ldedier.cpp-skeleton
  code --install-extensi ldedier.hpp-skeleton
  code --install-extensi lextudio.restructuredtext
  code --install-extensi mhutchie.git-graph
  code --install-extensi ms-azuretools.vscode-docker
  code --install-extensi ms-python.python
  code --install-extensi ms-vscode.cpptools
  code --install-extensi ms-vscode.Go
  code --install-extensi ms-vscode.vscode-typescript-tslint-plugin
  code --install-extensi ms-vsliveshare.vsliveshare
  code --install-extensi nicolaspolomack.epitech-c-cpp-headers
  code --install-extensi octref.vetur
  code --install-extensi PKief.material-icon-theme
  code --install-extensi pranaygp.vscode-css-peek
  code --install-extensi Prisma.prisma
  code --install-extensi Prisma.vscode-graphql
  code --install-extensi shardulm94.trailing-spaces
  code --install-extensi tomoki1207.pdf
  code --install-extensi tomoki1207.selectline-statusbar
  code --install-extensi tuguldurio.monokai-sweet
  code --install-extensi walter-ribeiro.full-react-snippets
  code --install-extensi will-stone.plastic

  curl -fsSL https://raw.github.com/PaulMonnery/personnal_conf/master/dotfiles/keybindings.json > ~/.config/Code/User/keybindings.json
  curl -fsSL https://raw.github.com/PaulMonnery/personnal_conf/master/dotfiles/settings.json > ~/.config/Code/User/settings.json

else
  exit 1
fi
