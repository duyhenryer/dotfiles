#!/bin/zsh

if [[ $UID -eq 0 ]]; then
    # pass
else
    if [ -d "$ZSH/alias.d" ]; then
        for file in $ZSH/alias.d/*.zsh; do
            source "$file"
        done
    fi
fi

