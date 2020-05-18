New Mac Dev Setup scripts
=================

Table of contents
=================

<!--ts-->
   * [Pre-setup](#pre-setup)
   * [Installation](#installation)
   * [Key mapping](#key-mapping)
   * [Measure of Neovim](#measure-of-neovim)
<!--te-->


## Pre-Setup

Install Homebrew and git, and set up SSH for Github

```bash
curl --remote-name https://raw.githubusercontent.com/hungdh0x5e/dotfiles/master/setup/pre-setup.sh
chmod a+x pre-setup.sh
./pre-setup.sh
```

Manually Install latest (non beta) Xcode from the [app store](https://developer.apple.com/xcode/downloads/)

## Installation

### Setup

```bash
git clone git@github.com:hungdh0x5e/dotfiles.git ~/dotfiles && cd ~/dotfiles/setup && chmod a+x setup.sh && ./setup.sh
```

### Finishing touches

  1. open `tmux` and install plugins: `CTRL + Space, I`. For first time, you need clone [tpm-plugin](https://github.com/tmux-plugins/tpm/issues/17#issuecomment-119260843)
  1. open `nvim` and run `:PlugInstall` and `:UpdateRemotePlugins`
  1. Change key repeat rate / delay to fast/short in keyboard preferences
  1. Swap ESC and CAPS key in keyboard preferences (OSX Sierra now supports this)
  1. Connect iterm2 profile to dotfiles: [(instructions)](http://stackoverflow.com/a/25122646/4298624)

### Customizing

I certainly do NOT recommend installing all of my setup without looking through what is happening and customizing it for yourself. Fork this repo and update anything you like.

Look through the shell scripts  in `setup` folder to see what programs are being installed. You can add or remove everything from there. Most likely, if you are not a VIM power user you will want to modify some of the shell and atom plugins/config to suit yours preferences.

## Key mapping

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

## Measure of Neovim

**Startup time**

```
Measured: 20 times

Total Average: 162.488300 msec
Total Max:     168.835000 msec
Total Min:     155.318000 msec
```

**Top Plugin slowing**

```
$ ./nvim/measure-profile.py -n 50 nvim

Running nvim to generate startup logs... done.
Loading and processing logs... done.
Plugin directory: /Users/hungdh4/.config/nvim/plugged

=====================================
Top 50 plugins slowing nvim's startup
=====================================
1         6.129   vim-airline
2         4.751   vim-colors-solarized
3         3.942   vimwiki
4         2.574   vim-gitgutter
5         1.994   vim-devicons
6         1.538   vim-airline-themes
7         1.178   vim-fugitive
8         1.083   vim-bundler
9         0.915   supertab
10        0.833   fzf.vim
11        0.771   vim-rails
12        0.705   ultisnips
13        0.627   vim-prettier
14        0.589   vim-tmux-runner
15        0.493   matchit.zip
16        0.460   editorconfig-vim
17        0.451   vim-surround
18        0.437   vim-multiple-cursors
19        0.425   auto-pairs
20        0.307   vim-endwise
21        0.243   vim-ruby
22        0.212   vim-rooter
23        0.165   vim-tmux-navigator
24        0.164   vim-commentary
25        0.124   cosco.vim
26        0.102   vim-rspec
27        0.086   vim-scratch
28        0.057   vim-javascript
29        0.053   vim-jsx
30        0.045   vim-snippets
31        0.029   vim-run-interactive
32        0.024   tern_for_vim
33        0.021   scss-syntax.vim
34        0.020   vim-vue
=====================================

```
