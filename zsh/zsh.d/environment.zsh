#!/bin/zsh


# enable correction
setopt correctall

# autocd
setopt autocd

# extended globbing
setopt extendedglob

# enable colors
autoload -Uz colors
colors

# path
typeset -U path
#path=($HOME/.local/bin $HOME/.rvm/bin $HOME/.local/lib $path[@])

# Editor
export EDITOR='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Default terminal
#export TERM="rxvt-unicode-256color"

# CNF hooks
[[ -f /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh

# Freeze shell when launching ncurse applications
ttyctl -f

# `grep` color
export GREP_COLOR='1;32'

# `less` color
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')
export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R '

