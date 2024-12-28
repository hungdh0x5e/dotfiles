plugins=(
  git
  macos
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting
  vi-mode
  kubectl
  docker
  docker-compose
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
