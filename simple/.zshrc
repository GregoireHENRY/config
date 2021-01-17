#!/usr/bin/env zsh

export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.cargo/bin:$HOME/sw"
export EDITOR="/usr/bin/vim"
fpath+="${ZDOTDIR:-~}/.zsh_functions"

# Theme
ZSH_THEME="greghenry"

# General settings
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="mm/dd/yyyy"
setopt inc_append_history
setopt extendedglob

# Plugins
plugins=(git)

# ohmyzsh
source $ZSH/oh-my-zsh.sh

# Aliases
source $HOME/.config/aliases

# Startup
ls
