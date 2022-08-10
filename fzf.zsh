# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/hungdh4/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/Users/hungdh4/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/hungdh4/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/hungdh4/.fzf/shell/key-bindings.zsh"
