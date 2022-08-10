#!/bin/sh
brew tap homebrew/cask

echo "Installing CLI tools"
applications=(
    openssl
    fzf
    fd
    ripgrep
    the_silver_searcher
    wget
    tree
    lazygit

    tmux
    reattach-to-user-namespace

    python3
    neovim
)

for i in ${applications[@]} ; do
    echo 
    echo "Processing $i"
    brew install $i
    echo "------"
done

echo "Clone tmux-plugins/tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# fancy_echo "Installing python and setting up Neovim"
# brew install python3
# brew install neovim/neovim/neovim
# curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
#     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# pip3 install neovim

# openssl@3 is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS provides LibreSSL.

# If you need to have openssl@3 first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"' >> ~/.zshrc

# For compilers to find openssl@3 you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
