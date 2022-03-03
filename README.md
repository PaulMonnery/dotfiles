# Personnal environment files

## Shell Setup

<br>
<Details><Summary><strong>Full command</strong></Summary>

```sh
sudo apt update && sudo apt install -y zsh git wget curl
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
curl https://raw.githubusercontent.com/PaulMonnery/dotfiles/master/dotfiles/.emacs.d.tgz | tar -zx -C $HOME
```

</Details>
<br>

Copy `.zshrc` and then run theses installations steps:

Oh my zsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Zsh completion plugins
```sh
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Fzf
```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Asdf
```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
```

Emacs configuration
```sh
curl https://raw.githubusercontent.com/PaulMonnery/dotfiles/master/dotfiles/.emacs.d.tgz | tar -zx -C $HOME
```

## Basics tools

- poetry
- exa
- bat
- fdfind
- lazydocker
- direnv
