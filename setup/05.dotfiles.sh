#!/bin/sh
source ~/dotfiles/setup/functions.sh

dotfiles=(
  zsh
  bin
  aliases
  fzf.zsh
  p10k.zsh
  gitconfig
  gitmessage
  tmux.conf
  zshenv
  zshrc
  nvim
  rspec
  psqlrc
  ideavimrc
  yamlfmt.yaml
)

nvimpath="~/.config/nvim"

fancy_echo "Backup current config"
today=`date +%Y%m%d`
for i in ${dotfiles[@]} ; do
  fancy_echo "Backup config ${i}"

  if [ "nvim" == "$i" ]; then
    [ -e ~$nvimpath ] && [ ! -L ~$nvimpath ] && mv ~$nvimpath ~$nvimpath.bak.$today ;
    [ -L ~$nvimpath ] && unlink ~$nvimpath ;
  else
    [ -e ~/.$i ] && [ ! -L ~/.$i ] && mv ~/.$i ~/.$i.bak.$today ;
    [ -L ~/.$i ] && unlink ~/.$i ;
  fi

done

fancy_echo "Symlinking dotfiles"
for i in ${dotfiles[@]} ; do
  fancy_echo "Symlinking dotfile ${i}"

  if [ "nvim" == "$i" ]; then
    ln -s ~/dotfiles/nvim $nvimpath
  else
    ln -s ~/dotfiles/$i ~/.$i
  fi
done
