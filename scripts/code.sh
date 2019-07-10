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
  code --install-extension austin.code-gnu-global
  code --install-extension eamodio.gitlens
  code --install-extension gerane.Theme-FlatlandMonokai
  code --install-extension gerane.Theme-Monokai-Contrast
  code --install-extension lextudio.restructuredtext
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-mssql.mssql
  code --install-extension ms-python.python
  code --install-extension ms-vscode.cpptools
  code --install-extension ms-vscode.Go
  code --install-extension ms-vscode.vscode-typescript-tslint-plugin
  code --install-extension msyrus.go-doc
  code --install-extension nicolaspolomack.epitech-c-cpp-headers
  code --install-extension Prisma.prisma
  code --install-extension Prisma.vscode-graphql
  code --install-extension redhat.java
  code --install-extension shardulm94.trailing-spaces
  code --install-extension tomoki1207.pdf
  code --install-extension tomoki1207.selectline-statusbar
  code --install-extension walter-ribeiro.full-react-snippets
  code --install-extension wmira.react-playground-vscode

  curl -fsSL https://raw.github.com/PaulMonnery/personnal_conf/master/dotfiles/keybindings.json > ~/.config/Code/User/keybindings.json
  curl -fsSL https://raw.github.com/PaulMonnery/personnal_conf/master/dotfiles/settings.json > ~/.config/Code/User/settings.json

else
  exit 1
fi
