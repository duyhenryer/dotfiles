#!/bin/zsh

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR="%{$fg_bold[red]%}|%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[red]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[cyan]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"

ZSH_THEME_ENV_PROMPT_PREFIX="%{$fg_bold[blue]%}env:(%{$reset_color%}"
ZSH_THEME_ENV_PROMPT_SUFFIX="%{$fg_bold[blue]%})%{$reset_color%}"

ZSH_THEME_PYENV_PROMPT_PREFIX=" %{$fg_bold[yellow]%}"
ZSH_THEME_PYENV_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_RBENV_PROMPT_PREFIX="%{$fg_bold[red]%}"
ZSH_THEME_RBENV_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_NODENV_PROMPT_PREFIX=" %{$fg_bold[green]%}"
ZSH_THEME_NODENV_PROMPT_SUFFIX="%{$reset_color%}"

ZSH_THEME_SSH_PROMPT_PREFIX=" %{$fg_bold[magenta]%}ssh:(%{$reset_color%}"
ZSH_THEME_SSH_PROMPT_SUFFIX="$ssh_prompt%{$fg_bold[magenta]%})%{$reset_color%}"

ZSH_THEME_SIGN_GLOBAL="@"
ZSH_THEME_SIGN_LOCAL="¥"

function _upsearch() {
    path="$PWD"

    while [[ "$path" != "" && ! -s "$path/$1" ]]; do
        path=${path%/*}
    done

    echo "$path/$1"
}

# Shows rbenv-based environment
# Supports rbenv, pyenv, nodenv
function _get_env_prompt() {
    local prompt dotfile sign prefix suffix env cmd version root

    # language-specific environment variables
    case "$1" in
        rbenv | ruby)
            env="rbenv"
            cmd="ruby"
            prefix="$ZSH_THEME_RBENV_PROMPT_PREFIX"
            suffix="$ZSH_THEME_RBENV_PROMPT_SUFFIX"
            version="$RBENV_VERSION"
            root="${RBENV_ROOT:=~/.rbenv}"
            ;;
        pyenv | python)
            env="pyenv"
            cmd="python"
            prefix="$ZSH_THEME_PYENV_PROMPT_PREFIX"
            suffix="$ZSH_THEME_PYENV_PROMPT_SUFFIX"
            version="$PYENV_VERSION"
            root="${PYENV_ROOT:=~/.pyenv}"
            ;;
        nodenv | node | nodejs)
            env="nodenv"
            cmd="node"
            prefix="$ZSH_THEME_NODENV_PROMPT_PREFIX"
            suffix="$ZSH_THEME_NODENV_PROMPT_SUFFIX"
            version="$NODENV_VERSION"
            root="${NODENV_ROOT:=~/.nodenv}"
            ;;
        *)
            return
            ;;
    esac

    if type $env &>/dev/null; then
        prompt="none"
        sign="$ZSH_THEME_SIGN_GLOBAL"

        if type $cmd &>/dev/null; then
            # search for local .${cmd}-version
            dotfile=$(_upsearch ".${cmd}-version")

            # get the current version
            if [ -f "$dotfile" ]; then
                prompt="$(cat "$dotfile")"
                sign="$ZSH_THEME_SIGN_LOCAL"
            elif [ -n "$version" ]; then
                prompt="$version"
            elif [ -n "$root/version" ]; then
                prompt="$(cat "$root/version")"
            fi

            # add language sign (global/local)
            if [[ $prompt == "system" ]]; then
                :
            elif [[ $prompt =~ '^[0-9]+' ]]; then
                prompt="${cmd}${sign}${prompt}"
            else
                prompt="${prompt}[$sign]"
            fi

            # display if current language version is not installed
            $cmd --version &>/dev/null || prompt="%{$fg_bold[magenta]%}${prompt}%{$reset_color%}"
        fi

        echo "${prefix}${prompt}${suffix}"
    fi
}

function _env_prompt() {
    local prompt
    prompt="$(_get_env_prompt rbenv)$(_get_env_prompt pyenv)$(_get_env_prompt nodenv)"

    # only show when env is available
    [ -n "$prompt" ] && echo ${ZSH_THEME_ENV_PROMPT_PREFIX}${prompt}${ZSH_THEME_ENV_PROMPT_SUFFIX}
}

# require to be in a ssh session
function _ssh_prompt() {
    # Format: ssh:(user@host:port)
    local user host port p_uname p_host_ p_port p_sign_1 p_sign_2

    if [[ -n $SSH_CONNECTION ]]; then
        user=$(whoami)
        host=$(echo $SSH_CONNECTION | cut -d ' ' -f 3)
        port=$(echo $SSH_CONNECTION | cut -d ' ' -f 4)

        # Username
        p_uname="%{$fg_bold[cyan]%}$user%{$reset_color%}"
        # @ sign
        p_sign_1="%{$fg_bold[magenta]%}@%{$reset_color%}"
        # Host
        p_host="%{$fg_bold[red]%}$host%{$reset_color%}"
        # : sign
        #p_sign_2="%{$fg_bold[magenta]%}:%{$reset_color%}"
        # Port
        #p_port="%{$fg_bold[red]%}$port%{$reset_color%}"

        echo ${ZSH_THEME_SSH_PROMPT_PREFIX}${p_uname}${p_sign_1}${p_host}${p_sign_2}${p_port}${ZSH_THEME_SSH_PROMPT_SUFFIX}
    fi
}

PROMPT='%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)%{$fg_bold[green]%}%p%{$reset_color%} %{$fg_bold[cyan]%}%c%{$reset_color%} $(git_super_status) '
#RPROMPT='$(_env_prompt)$(_ssh_prompt)'
RPROMPT='$(_ssh_prompt)'

