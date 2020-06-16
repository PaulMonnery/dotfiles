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
  code --install-extension 13xforever.language-x86-64-assembly
  code --install-extension aaron-bond.better-comments
  code --install-extension albymor.increment-selection
  code --install-extension austin.code-gnu-global
  code --install-extension bungcip.better-toml
  code --install-extension dbaeumer.vscode-eslint
  code --install-extension eamodio.gitlens
  code --install-extension ecmel.vscode-html-css
  code --install-extension foxundermoon.shell-format
  code --install-extension gerane.Theme-FlatlandMonokai
  code --install-extension justusadam.language-haskell
  code --install-extension kiteco.kite
  code --install-extension ldedier.cpp-skeleton
  code --install-extension ldedier.hpp-skeleton
  code --install-extension lextudio.restructuredtext
  code --install-extension mathiasfrohlich.Kotlin
  code --install-extension mhutchie.git-graph
  code --install-extension ms-azuretools.vscode-docker
  code --install-extension ms-python.python
  code --install-extension ms-vscode-remote.remote-ssh
  code --install-extension ms-vscode-remote.remote-ssh-edit
  code --install-extension ms-vscode.cmake-tools
  code --install-extension ms-vscode.cpptools
  code --install-extension ms-vscode.Go
  code --install-extension ms-vscode.vscode-typescript-tslint-plugin
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension msjsdiag.vscode-react-native
  code --install-extension nicolaspolomack.epitech-c-cpp-headers
  code --install-extension octref.vetur
  code --install-extension PKief.material-icon-theme
  code --install-extension pranaygp.vscode-css-peek
  code --install-extension Prisma.prisma
  code --install-extension Prisma.vscode-graphql
  code --install-extension shardulm94.trailing-spaces
  code --install-extension tomoki1207.pdf
  code --install-extension tomoki1207.selectline-statusbar
  code --install-extension tuguldurio.monokai-sweet
  code --install-extension twxs.cmake
  code --install-extension walter-ribeiro.full-react-snippets
  code --install-extension will-stone.plastic
  code --install-extension yzhang.markdown-all-in-one

  curl -fsSL https://raw.github.com/PaulMonnery/dotfiles/master/dotfiles/keybindings.json > ~/.config/Code/User/keybindings.json
  curl -fsSL https://raw.github.com/PaulMonnery/dotfiles/master/dotfiles/settings.json > ~/.config/Code/User/settings.json

else
  exit 1
fi
