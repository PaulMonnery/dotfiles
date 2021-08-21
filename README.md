# Personnal environment files

## Shell Setup

Copy `.zshrc` and then run theses installations steps:

Oh my zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Zsh completion plugins
```
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Fzf
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Asdf
```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
```

## Basics tools

- poetry
- exa
- bat
- fdfind
- lazydocker
