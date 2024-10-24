setopt hist_ignore_all_dups inc_append_history hist_ignore_space sharehistory
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096
HISTDUP=erase

export ERL_AFLAGS="-kernel shell_history enabled"
