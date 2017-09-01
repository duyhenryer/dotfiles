#!/bin/zsh

setopt append_history
setopt extended_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
#setopt hist_ignore_space
setopt hist_verify
setopt share_history

# History file
export HISTFILE="$ZSH/archive/history"

# History size
export HISTSIZE=10000

# Save history
export SAVEHIST=$HISTSIZE

