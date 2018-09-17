# vim:ft=sh:
###
### Bash Aliases
###

# mvf: for some time....
alias ls='ls -hAF --color=auto --time-style=long-iso'
alias ll='ls -l'
alias lr='ls -lhtr'

alias ..='cd ..'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias grep='egrep --color'

alias df='df -h'
alias env='env | sort'
alias envg='env | sort | grep -i'

alias netl='netstat -anlp | grep -i'
alias  psg='ps -ef | grep -v grep | grep -i'

alias rpmi='rpm -qi'
alias rpmc='rpm -qa | wc -l'
alias rpml='rpm -qa | sort'
alias rpmg='rpm -qa | sort | grep -i'

alias yuml='yum list '
alias yumg='yum list | grep -i'

alias susu="sudo su -"
alias syslog="tail -f /var/log/messages"

function mkcd  {
    mkdir -p "$1" && cd "$1"
}

