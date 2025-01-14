function fzf-pass() {
    ~/.bin/fpass
}
zle -N fzf-pass
bindkey '^g^p' fzf-pass
