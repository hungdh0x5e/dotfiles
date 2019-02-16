#!/bin/sh
source ~/dotfiles/setup/functions.sh

fancy_echo "Install gpg ..."
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

fancy_echo "Configuring Ruby ..."
curl -sSL https://get.rvm.io | bash -s stable --ruby

source ~/.rvm/scripts/rvm

gem update --system
gem_install_or_update 'bundler'

number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

gem_install_or_update 'rails'
