#!/bin/sh
source ~/dotfiles/setup/functions.sh

fancy_echo "Installing software for development: db, npm, node, redis, ..."
brew install bruno
brew install tableplus
# brew install postgresql
brew install redis
# brew services start redis
# brew instal kafka

fancy_echo "Setting up Golang"
brew install go@1.20
mkdir -p $HOME/go/{bin,src,pkg}

fancy_echo "Installing Goland IDE"
brew install goland

# fancy_echo "Setting up MySQL"
# brew install mysql
# mysql_secure_installation

fancy_echo "Setting up Docker"
brew instal --cask docker
brew instal docker-compose
