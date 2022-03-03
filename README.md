# Personnal environment files

## Shell Setup

<br>
<Details><Summary><strong>Full command</strong></Summary>

```sh
sudo apt update && sudo apt install -y zsh git wget curl direnv emacs
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s /bin/zsh -$USER
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
curl https://raw.githubusercontent.com/PaulMonnery/dotfiles/master/dotfiles/.zshrc > ~/.zshrc
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
curl https://raw.githubusercontent.com/PaulMonnery/dotfiles/master/dotfiles/.emacs.d.tgz | tar -zx -C ~
zsh
```

</Details>
<br>

Run theses installations steps:

Apt
```sh
sudo apt update && sudo apt install -y zsh git wget curl direnv emacs
```

Zsh & Oh my zsh
```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s /bin/zsh -$USER
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
curl https://raw.githubusercontent.com/PaulMonnery/dotfiles/master/dotfiles/.zshrc > ~/.zshrc
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
curl https://raw.githubusercontent.com/PaulMonnery/dotfiles/master/dotfiles/.emacs.d.tgz | tar -zx -C ~
```

## Basics tools

- poetry
- exa
- bat
- fdfind
- lazydocker
