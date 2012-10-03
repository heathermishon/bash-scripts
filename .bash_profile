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

# COLOR RULES
# Attribute codes (ATTR):
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed 
# 
# Text color codes (TEXT):
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# 
# Background color codes (BG):
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white
#
# Format: "\033[ATTR;TEXT;BGm]" (The last "m" is important)
export MAGENTA="\033[0;35m"
export COMPUTER="\033[0;33m"
export BLUE="\033[0;34m"
export GREEN="\033[0;32m"
export PURPLE="\033[4:35m"
export WHITE="\033[0;37m"
export USER="\033[0;31m"
export CYAN="\033[0;36m]"
export RESET="\033[m"

# export PS1="> \w : "
PS1="\[$USER\]\u \[$RESET\]at \[$COMPUTER\]\h \[$RESET\]in \[$GREEN\]\w\[$PURPLE\]\n\$ \[$RESET\]"
