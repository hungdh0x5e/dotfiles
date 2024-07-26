#!/bin/sh
brew tap homebrew/cask

fancy_echo "Installing application like: Iterm2, Chrome, Dropbox, Skype ..."
applications=(
    evkey

    iterm2
    bitwarden
    spotify
    telegram
    obsidian
    vlc

    brave
    firefox

    karabiner-elements
    logitech-options 
)

for i in ${applications[@]} ; do
    echo 
    echo "Processing $i"
    brew install $i
    echo "------"
done
