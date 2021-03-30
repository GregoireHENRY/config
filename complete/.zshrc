#!/usr/bin/env zsh

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/sw/pandoc/bin:$HOME/.cargo/bin:$HOME/sw:$HOME/.local/bin:/usr/local/go/bin:$HOME/sw/cspice"
export EDITOR="/usr/bin/vim"
fpath+="${ZDOTDIR:-~}/.zsh_functions"
export LFS="/mnt/lfs"

# Theme
ZSH_THEME="greghenry"

# Plugins
plugins=(git zsh-autosuggestions)

# ohmyzsh
source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.config/aliases
source $HOME/.config/user-dirs.dirs

# General settings
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
setopt inc_append_history
setopt extendedglob
export LANG=en_US.UTF-8
unsetopt correctall
setopt correct
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=238"

# Startup
rm -f ~/Telegram\ Desktop
ls
