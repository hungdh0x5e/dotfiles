#!/bin/sh
brew tap homebrew/cask

fancy_echo "Installing application like: Iterm2, Chrome, Dropbox, Skype ..."
applications=(
    evkey

    iterm2
    dropbox
    bitwarden
    slack
    skype
    spotify
    telegram
    obsidian
    vlc
)

for i in ${applications[@]} ; do
    echo 
    echo "Processing $i"
    brew install $i
    echo "------"
done
