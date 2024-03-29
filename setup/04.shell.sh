#!/bin/sh
source ~/dotfiles/setup/functions.sh

# shellcheck disable=SC2154
trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

if [ ! -d "$HOME/.bin/" ]; then
 mkdir "$HOME/.bin"
fi

if [ ! -f "$HOME/.zshrc" ]; then
 touch "$HOME/.zshrc"
fi

# shellcheck disable=SC2016
append_to_zshrc 'export PATH="$HOME/.bin:$PATH"'

HOMEBREW_PREFIX=$(brew --prefix)

# if [ -d "$HOMEBREW_PREFIX" ]; then
#  if ! [ -r "$HOMEBREW_PREFIX" ]; then
#    sudo chown -R "$LOGNAME:staff" /usr/local
#  fi
# else
#  sudo mkdir "$HOMEBREW_PREFIX"
#  sudo chflags norestricted "$HOMEBREW_PREFIX"
#  sudo chown -R "$LOGNAME:staff" "$HOMEBREW_PREFIX"
# fi

# case "$SHELL" in
#  */zsh) : ;;
#  *)
#    fancy_echo "Changing your shell to zsh ..."
#      chsh -s "$(which zsh)"
#    ;;
# esac

# curl -L https://iterm2.com/misc/install_shell_integration_and_utilities.sh | bash

fancy_echo "Installing font"

# Install nerd-font
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
brew install svn # required by font-source-code-pro
brew install font-source-code-pro

fancy_echo "Installing oh-my-zsh"
if [ -d "$HOME/.oh-my-zsh/" ]; then
  mv ~/.oh-my-zsh ~/.oh-my-zsh.bak
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

fancy_echo "Installing zsh plugin: suggestion + syntax highlight"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

fancy_echo "Installing powerlevel10k theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k