#!/bin/zsh

# Common aliases

alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'

alias grep='grep --color=auto'
alias history='fc -il 1'
alias h='history'
alias lsblk="lsblk -oNAME,SIZE,OWNER,GROUP,MODE,FSTYPE,LABEL,MOUNTPOINT,PARTUUID"
alias mkdir='mkdir -p -v'
alias mpc="mpc --host XHv1OqE6Yy1oZbF5@localhost --port 2856"
alias mv='mv -iv'
alias open='xdg-open'
alias reload="exec /bin/zsh"
alias rename='rename -v'
alias rm='rm -Iv --one-file-system'
alias tree="tree -C"
alias view='nvim -R'

alias yaourt='pacaur'

alias check-ipv4="curl ipv4.icanhazip.com"
alias check-ipv6="curl ipv6.icanhazip.com"
alias dud='du -d 1 -h'
alias duf='du -sh *'

alias restart-tty1="sudo systemctl restart getty@tty1.service"
alias restart-tty2="sudo systemctl restart getty@tty2.service"
alias restart-tty3="sudo systemctl restart getty@tty3.service"
alias restart-tty4="sudo systemctl restart getty@tty4.service"
alias restart-tty5="sudo systemctl restart getty@tty5.service"
alias restart-tty6="sudo systemctl restart getty@tty6.service"

alias syspoweroff="systemctl poweroff"
alias sysreboot="systemctl reboot"
alias sysuser="systemctl --user"

alias dd="false"  # btrfs caution
