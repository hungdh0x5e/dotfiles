#!/bin/sh
source ~/dotfiles/setup/functions.sh

if ! command -v brew >/dev/null; then
 fancy_echo "Installing Homebrew ..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

   append_to_zshrc '# recommended by brew doctor'

   # shellcheck disable=SC2016
   append_to_zshrc 'export PATH="/usr/local/bin:$PATH"' 1

   export PATH="/usr/local/bin:$PATH"
fi

if brew list --formula | grep -Fq brew-cask; then
 fancy_echo "Uninstalling old Homebrew-Cask ..."
 brew uninstall --force brew-cask
fi

fancy_echo "Installing git with Homebrew ..."
brew install git
brew tap homebrew/cask
