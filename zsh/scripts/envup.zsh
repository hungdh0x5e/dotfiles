#!/bin/zsh

# Load .env file into shell session for environment variables
function envup() {
  filename="$1"
  if [ -z $filename ]; then
    filename=".env"
  fi

  if [ -f "$filename" ]; then
    echo "Load env from file: $filename"
    set -o allexport
    source <(cat "$filename" | sed -e '/^#/d;/^\s*$/d' -e "s/'/'\\\''/g" -e "s/=\(.*\)/='\1'/g")
    set +o allexport
  else
    echo "File $filename not found" 1>&2
    return 1
  fi
}
