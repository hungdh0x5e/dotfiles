# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}

setopt promptsubst

# Allow exported PS1 variable to override default prompt.
if ! env | grep -q '^PS1='; then
  PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hungdh/workspace/Onaclover/firebase-admin/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/hungdh/workspace/Onaclover/firebase-admin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hungdh/workspace/Onaclover/firebase-admin/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/hungdh/workspace/Onaclover/firebase-admin/google-cloud-sdk/completion.zsh.inc'; fi
