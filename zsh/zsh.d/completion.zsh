#!/bin/zsh

# Load other definitions
fpath=($ZSH/completion.d $fpath)

# tab completion
autoload -Uz compinit
compinit

# Verbose completion
zstyle ':completion:*' verbose yes

# arrow-key driven completion
zstyle ':completion:*' menu select

# Remap autocompletion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# aliases support
setopt COMPLETE_ALIASES

# plugins

# autosuggestion
source "$ZSH/plugin.d/zsh-autosuggestions/zsh-autosuggestions.zsh"
