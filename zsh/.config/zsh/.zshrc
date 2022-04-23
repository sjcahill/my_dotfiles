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
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins added with `zsh_add_plugin` from `zsh-functions` file
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"
# More plugins available @ https://github.com/unixorn/awesome-zsh-plugins
# More completions available @ https://github.com/zsh-users/zsh-completions

# Poetry dependency manager for Python
fpath+="$HOME/.zfunc"

# Key-bindings
bindkey '^[[3~' delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down

compinit

# Remap caps to escape
setxkbmap -option caps:escape

# Environment variables for applications
export EDITOR"nvim"
export TERMINAL="kitty"
export BROWSER="firefox"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sj/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sj/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sj/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sj/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


export PATH="$HOME/.poetry/bin:$PATH"
