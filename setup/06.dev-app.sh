#!/bin/sh
source ~/dotfiles/setup/functions.sh

brew tap homebrew/cask

fancy_echo "Installing software for development: db, npm, node, redis, ..."
brew install postman
brew install tableplus
brew install postgresql
brew install redis
brew services start redis
brew instal kafka

fancy_echo "Setting up Golang"
brew install go@1.16
mkdir -p $HOME/go/{bin,src,pkg}

append_to_zshrc 'export GOPATH=$HOME/go' 1
append_to_zshrc 'export GOROOT="$(brew --prefix golang)/libexec"' 1
append_to_zshrc 'export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"' 1

fancy_echo "Installing Goland IDE"
brew install goland

fancy_echo "Setting up MySQL"
brew install mysql
mysql_secure_installation