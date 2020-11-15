#!/bin/sh
source ~/dotfiles/setup/functions.sh

brew tap homebrew/cask

fancy_echo "Installing software for development: db, npm, node, redis, ..."
brew cask install visual-studio-code
brew cask install postman
brew cask install tableplus
brew install heroku

brew install postgresql
brew services start postgresql
brew install redis
brew services start redis

fancy_echo "Setting up Node with NVM"
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

nvm install node
nvm alias default node

fancy_echo "Installing global npm packages"
npm install -g npm@latest
npm install -g npm-check-updates browser-sync

fancy_echo "Installing Yarn"
brew install yarn
export PATH="$PATH:`yarn global bin`"

fancy_echo "Setting up Golang"
brew install go
mkdir -p $HOME/go/{bin,src,pkg}
read -r -d '' VAR << EOM
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
EOM
fancy_echo "Should write setting below into .zshrc/ .bashrc\n$VAR"
fancy_echo "Installing Goland IDE"
brew cask install goland

fancy_echo "Setting up MySQL"
brew install mysql
mysql_secure_installation