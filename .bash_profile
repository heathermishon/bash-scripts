# aliases
alias cd..="cd .."
alias l="ls -al"
alias lp="ls -p"
alias lsd='ls -Gl | grep "^d"'
alias reload="source ~/.bash_profile"
alias ..="cd .."
alias ...="cd ../.."
alias update='sudo softwareupdate -i -a; brew update; brew upgrade'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias lanip="ipconfig getifaddr en1"
alias ipl="ipconfig getifaddr en1"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Path
PATH=${PATH}:"/usr/local/bin:/usr/local/sbin:usr/local/lib;/usr/local/mysql/bin:$PATH"
PATH=${PATH}:~/bin

# Environment Vars
export LSCOLORS=gxfxcxdxbxggedabagacad
export CLICOLOR=1
export VIM_APP_DIR=/Applications/MacVim-snapshot-62

# git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

# bashrc
if [ -f ~/.bashrc ] ; then
	. ~/.bashrc
fi

	MAGENTA=""
	COMPUTER="\033[0;33m"
	BLUE="\033[0;34m"
	GREEN="\033[0;32m"
	PURPLE="\033[4:35m"
	WHITE="\033[0;37m"
	USER="\033[0;31m"
	RESET="\033[m"

export MAGENTA
export COMPUTER
export BLUE
export GREEN
export PURPLE
export WHITE
export USER
export RESET

# export PS1="> \w : "
PS1="\[$USER\]\u \[$RESET\]at \[$COMPUTER\]\h \[$RESET\]in \[$GREEN\]\w\[$PURPLE\]\n\$ \[$RESET\]"
