#!/bin/bash

export ZDOTDIR=$HOME/.config/zsh
HISTFILE=~/.zsh_history
setopt appendhistory

# Some useful options
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef			# Disbale ctrl-s to freeze terminal
zle_highlight=('paste:none')

# Stopping beeps
unsetopt BEEP

# Completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)	# Include hidden files in completions

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Sourcing functions from `zsh-functions` file
source "$ZDOTDIR/zsh-functions"

# Sourcing files with `zsh-add-file` function from `zsh-functions` file
zsh_add_file "zsh_exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins added with `zsh_add_plugin` from `zsh-functions` file
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# More plugins available @ https://github.com/unixorn/awesome-zsh-plugins
# More completions available @ https://github.com/zsh-users/zsh-completions

# Key-bindings
bindkey '^[[P' delete-char
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down


compinit


# Remap caps to escape
setxkbmap -option caps:escape

# Environment variables for applications
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
