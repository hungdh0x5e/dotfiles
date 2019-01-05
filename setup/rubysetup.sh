#!/bin/sh
source ~/dotfiles/setup/functions.sh

fancy_echo "Configuring Ruby ..."

rvm install ruby-head

gem update --system
gem_install_or_update 'bundler'
number_of_cores=$(sysctl -n hw.ncpu)
bundle config --global jobs $((number_of_cores - 1))

gem_install_or_update 'rails'
