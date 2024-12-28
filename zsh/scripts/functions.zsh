#!/bin/zsh

# Open fzf in tmux popup
function __fzfp() {
  fzf --height=50% --tmux 90%,70% \
    --layout=reverse --multi --min-height=20 --border \
    --color='header:italic:underline,label:blue' \
    "$@"
}

function __close_all_apps() {
  apps=$(osascript -e 'tell application "System Events" to get name of (processes where background only is false)' | awk -F ', ' '{for(i=1;i<=NF;i++) printf "%s;", $i}')
  while [ "$apps" ] ;do
    app=${apps%%;*}
    if [[ $app != 'wezterm' ]]
    then
      pkill -x echo $app
    fi

    [ "$apps" = "$app" ] && \
        apps='' || \
        apps="${apps#*;}"
  done
}

function reboot() {
  __close_all_apps

  sudo reboot
}

function shutdown() {
  __close_all_apps

  sudo shutdown -h now
}

function sayhi() {
  e_bold "Host name: $(hostname), User: $(whoami)"
  e_success "On $(sw_vers -productName)$(sw_vers -productVersion), build version: $(sw_vers -buildVersion)"
  e_success "Shell: $(zsh --version)"
  e_success "Terminal color: $TERM"
  e_success "Uptime: $(uptime | sed 's/.*up \([^,]*\), .*/\1/')"

  echo "Hi Huy Hung.\n\nShut-up and keep working!" | cowsay | lolcat
}

# Lauch application
function fapp() {
  local app=$((ls /Applications; ls /System/Applications/; ls /System/Applications/Utilities) | cat | sed 's/.app//g' | __fzfp --prompt 'Applications❯ ' --no-multi )
  if [ -n "$app" ]; then
    open -a $app
  fi
}
