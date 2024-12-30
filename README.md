# New Mac Web Dev Setup scripts

## Pre-Setup (If you don't have Homebrew and/or Github setup with SSH access)
Install Homebrew and git, and set up SSH for Github
```bash
curl --remote-name https://raw.githubusercontent.com/colbycheeze/dotfiles/master/setup/pre-setup.sh
chmod a+x pre-setup.sh
./pre-setup.sh
```
Manually Install latest (non beta) Xcode from the [app store](https://developer.apple.com/xcode/downloads/)

## Setup
   `git clone git@github.com:hungdh0x5e/dotfiles.git ~/dotfiles && cd ~/dotfiles/setup && chmod a+x setup.sh && ./setup.sh`

## Finishing touches
  1. open `tmux` and install plugins: `CTRL + Space, I`. For first time, you need clone [tpm-plugin](https://github.com/tmux-plugins/tpm/issues/17#issuecomment-119260843)
  1. open `nvim` and run `:PlugInstall` and `:UpdateRemotePlugins`
  1. Register Divvy and add any hotkeys for window management
  1. Change key repeat rate / delay to fast/short in keyboard preferences
  1. Swap ESC and CAPS key in keyboard preferences (OSX Sierra now supports this)
  1. Connect iterm2 profile to dotfiles: [(instructions)](http://stackoverflow.com/a/25122646/4298624)

## Customizing
I certainly do NOT recommend installing all of my setup without looking through what is happening and customizing it for yourself. Fork this repo and update anything you like.

Look through the shell scripts  in `setup` folder to see what programs are being installed. You can add or remove everything from there. Most likely, if you are not a VIM power user you will want to modify some of the shell and atom plugins/config to suit yours preferences.

## What's in it?
**vim configuration**
- Set `leader` to single space
- Use `Ag` instead Grep when available
- Syntax highlighting for Markdown, HTML, JavaScript, Ruby, Go, Elixir, more.
- Use [Vim-plug](https://github.com/junegunn/vim-plug) to  manage plugin
- Use fzf search. Hot key: <Leader> + f|F|b|B|t|T
- `-` for open NERDTree - File management

**tmux configuration**
- Set `prefix` to `Ctrl + Space`

**Other**

- Hombrew multi user setup: run script `brew-mult.sh`
