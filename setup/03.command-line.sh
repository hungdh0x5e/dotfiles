#!/bin/sh
brew tap homebrew/cask

echo "Installing CLI tools"
applications=(
    openssl
    fzf
    fd
    ripgrep
    wget
    tree
    lazygit
    jq
    jless
    yq

    tmux
    reattach-to-user-namespace

    python3
    neovim

    cowsay
    lolcat
)

for i in ${applications[@]} ; do
    echo 
    echo "Processing $i"
    brew install $i
    echo "------"
done

echo "Clone tmux-plugins/tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# openssl@3 is keg-only, which means it was not symlinked into /opt/homebrew,
# because macOS provides LibreSSL.

# If you need to have openssl@3 first in your PATH, run:
#   echo 'export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"' >> ~/.zshrc

# For compilers to find openssl@3 you may need to set:
#   export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
#   export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
