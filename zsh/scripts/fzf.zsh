#!/bin/zsh

# Open fzf in tmux popup
function __fzfp() {
  fzf-tmux -p -w 70% -h 70%
}

# Open project under workspace folder
function fprj() {
  cd $WORKSPACE; ls -d */ | __fzfp | {
    cd -;
    read result;
    if [ ! -z "$result" ]; then
      cd $WORKSPACE/$result
    fi
  }
  zle && zle reset-prompt
}

# Run frequently used commands
# First param take local path to set of commands, i.e. ~/local/cmds
function fcmd() {
  echo $1
  local cmd=$(cat $1 | ${2-"__fzfp"})
  if [ -n "$cmd" ]; then
    local escape=$(echo $cmd | sed 's/[]\/$*.^[]/\\&/g')
    echo -e "$cmd\n$(cat $1 | sed "s/$escape//g" | sed '/^$/d')" > $1
    echo ""
    echo $fg[yellow] "$cmd"
    echo ""
    eval $cmd
  else
    echo $fg[red] "Run nothing!"
  fi
}


# Lauch application
function fapp() {
  local app=$((ls /Applications; ls /System/Applications/; ls /System/Applications/Utilities) | cat | sed 's/.app//g' | fzf)
  open -a $app
}

