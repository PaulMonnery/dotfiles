# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pmonnery/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/pmonnery/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pmonnery/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/pmonnery/.fzf/shell/key-bindings.zsh"
