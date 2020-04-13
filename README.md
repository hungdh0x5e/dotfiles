# New Mac Web Dev Setup scripts

## Pre-Setup (If you don't have Homebrew and/or Github setup with SSH access)

Install Homebrew and git, and set up SSH for Github

```bash
curl --remote-name https://raw.githubusercontent.com/hungdh0x5e/dotfiles/master/setup/pre-setup.sh
chmod a+x pre-setup.sh
./pre-setup.sh
```

Manually Install latest (non beta) Xcode from the [app store](https://developer.apple.com/xcode/downloads/)

## Setup
   `git clone git@github.com:hungdh0x5e/dotfiles.git ~/dotfiles && cd ~/dotfiles/setup && chmod a+x setup.sh && ./setup.sh`

## Finishing touches
  1. open `tmux` and install plugins: `CTRL + Space, I`. For first time, you need clone [tpm-plugin](https://github.com/tmux-plugins/tpm/issues/17#issuecomment-119260843)
  1. open `nvim` and run `:PlugInstall` and `:UpdateRemotePlugins`
  1. Change key repeat rate / delay to fast/short in keyboard preferences
  1. Swap ESC and CAPS key in keyboard preferences (OSX Sierra now supports this)
  1. Connect iterm2 profile to dotfiles: [(instructions)](http://stackoverflow.com/a/25122646/4298624)

## Customizing
I certainly do NOT recommend installing all of my setup without looking through what is happening and customizing it for yourself. Fork this repo and update anything you like.

Look through the shell scripts  in `setup` folder to see what programs are being installed. You can add or remove everything from there. Most likely, if you are not a VIM power user you will want to modify some of the shell and atom plugins/config to suit yours preferences.

## Key mapping?

**Tmux**

| Command        | Description           |
| ---            | ---                   |
| `Ctrl + Space` | Prefix                |
| `Ctrl + ijkl`  | Move around the panel |
| `prefix + [`   | Copy mode             |
| `y`            | Copy                  |


**VIM Configuration**

| Command        | Description                          |
| ---            | ---                                  |
| `space`        | Set `leader` to single space         |
|                |                                      |
| `<leader>,`    | Stop highlight after searching       |
| `<leader*2>r,` | Reload vim config                    |
| `<leader>-`    | Zoom a vim pane                      |
| `<leader>=`    | Zoom comeback                        |
|                |                                      |
| **Fzf**        | **Search**                           |
| `<Ctrl-f>`     | Search keyword in project file       |
| `<leader>F`    | GFiles                               |
| `<leader>f`    | Files                                |
| `<leader>b`    | Buffers                              |
| `<leader>h`    | History                              |
| `<leader>t`    | BTags                                |
| `<leader>T`    | Tags                                 |
|                | In fzf file result                   |
| `<Ctrl-t>`     | Open file in other tab               |
| `<Ctrl-s>`     | Open file horizontal                 |
| `<Ctrl-v>`     | Open file vertical                   |
|                |                                      |
| **Git**        | **Git fugitive**                     |
| `<leader>gb`   | Gblame                               |
| `<leader>gc`   | Gcommit                              |
| `<leader>gd`   | Gdiff                                |
| `<leader>gg`   | Ggrep                                |
| `<leader>gl`   | Glog                                 |
| `<leader>gp`   | Git pull                             |
| `<leader>gP`   | Git push                             |
| `<leader>gs`   | Gstatus                              |
| `<leader>gw`   | Gbrowse                              |
|                |                                      |
| **NERDTree**   | **File Explorer**                    |
| `-`            | Toggle NERDTree                      |
| `=`            | Load NERDTree where the current file |
|                |                                      |

