# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export FZF_DEFAULT_OPTS="
  --height=40%
  --layout=reverse
  --info=inline
  --border
  --color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934"

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'

# --preview 'bat -n --color=always {}'
# --bind 'ctrl-/:change-preview-window(down|hidden|)'
