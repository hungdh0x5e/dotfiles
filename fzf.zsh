# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude ".git" .'
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules}/**'"
export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules}/**'"
export FZF_ALT_C_COMMAND="fd --type d --no-ignore-vcs --exclude node_modules --exclude .git"