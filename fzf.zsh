# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/hungdh/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/hungdh/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/hungdh/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/hungdh/.fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules}/**'"
export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules}/**'"
export FZF_ALT_C_COMMAND="fd --type d --no-ignore-vcs --exclude node_modules --exclude .git"
