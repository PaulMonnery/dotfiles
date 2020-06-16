#!/bin/bash

RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
BOLD="$(tput bold)"
NORMAL="$(tput sgr0)"

EXTENSIONS=(13xforever.language-x86-64-assembly aaron-bond.better-comments
  albymor.increment-selection austin.code-gnu-global bungcip.better-toml
  dbaeumer.vscode-eslint eamodio.gitlens ecmel.vscode-html-css foxundermoon.shell-format
  gerane.Theme-FlatlandMonokai justusadam.language-haskell kiteco.kite ldedier.cpp-skeleton
  ldedier.hpp-skeleton lextudio.restructuredtext mathiasfrohlich.Kotlin mhutchie.git-graph
  ms-azuretools.vscode-docker ms-python.python ms-vscode-remote.remote-ssh
  ms-vscode-remote.remote-ssh-edit ms-vscode.cmake-tools ms-vscode.cpptools ms-vscode.Go
  ms-vscode.vscode-typescript-tslint-plugin ms-vsliveshare.vsliveshare msjsdiag.vscode-react-native
  nicolaspolomack.epitech-c-cpp-headers octref.vetur PKief.material-icon-theme pranaygp.vscode-css-peek
  Prisma.prisma Prisma.vscode-graphql shardulm94.trailing-spaces tomoki1207.pdf tomoki1207.selectline-statusbar
  tuguldurio.monokai-sweet twxs.cmake walter-ribeiro.full-react-snippets will-stone.plastic yzhang.markdown-all-in-one)

read -p "${YELLOW}Is Visual Studio Code installed?${NORMAL} " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for i in "${EXTENSIONS[@]}"; do
    echo $i
  done
  curl -fsSL https://raw.github.com/PaulMonnery/dotfiles/master/dotfiles/keybindings.json >~/.config/Code/User/keybindings.json
  curl -fsSL https://raw.github.com/PaulMonnery/dotfiles/master/dotfiles/settings.json >~/.config/Code/User/settings.json
  curl -fsSL https://raw.github.com/PaulMonnery/dotfiles/master/dotfiles/c.json.json >~/.config/Code/User/snippets/c.json
  curl -fsSL https://raw.github.com/PaulMonnery/dotfiles/master/dotfiles/cpp.json.json >~/.config/Code/User/snippets/cpp.json

else
  exit 1
fi
