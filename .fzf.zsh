# Setup fzf
# ---------
if [[ ! "$PATH" == */home/arch/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/arch/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/arch/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/arch/.fzf/shell/key-bindings.zsh"
