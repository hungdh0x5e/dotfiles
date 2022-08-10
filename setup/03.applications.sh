#!/bin/sh
brew tap homebrew/cask

echo "Installing application like: Iterm2, Chrome, Dropbox, Skype ..."
applications=(
    evkey

    iterm2
    dropbox
    bitwarden
    slack
    skype
    spotify
    notion
    vlc

    visual-studio-code
)

for i in ${applications[@]} ; do
    echo 
    echo "Processing $i"
    brew install $i
    echo "------"
done

# brew cask install steam
# brew cask install kindle
# fancy_echo "Installing CLI tools"
# brew install git
# brew install openssl
# brew install fzf
# brew install fd
# brew install ripgrep
# Fzf config with ripgrep + fd
# export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules}/**'"
# export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --glob '!*/{.git,node_modules}/**'"
# export FZF_ALT_C_COMMAND="fd --type d --no-ignore-vcs --exclude node_modules --exclude .git"
# brew install the_silver_searcher
# brew install wget
# brew install imagemagick
# brew install watchman # needed for jest --watch

# fancy_echo "Setting up tmux"
# brew install tmux
# brew install reattach-to-user-namespace
# brew install tree
# git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# fancy_echo "Installing python and setting up Neovim"
# brew install python3
# brew install neovim/neovim/neovim
# curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# pip3 install neovim