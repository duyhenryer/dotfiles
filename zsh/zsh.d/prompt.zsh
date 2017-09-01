#!/bin/zsh

# initialize prompt support
autoload -U promptinit
promptinit
setopt promptsubst

if [[ $UID -eq 0 ]]; then
    source '$ZSH/prompt.d/root.zsh'
else
    # load required plugins
    source "$ZSH/plugin.d/zsh-git-prompt/zshrc.sh"

    # main prompt
    source "$ZSH/prompt.d/user.zsh"

    # mysql prompt
    source "$ZSH/prompt.d/mysql.zsh"
fi
