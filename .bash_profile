# aliases
alias cd..="cd .."
alias l="ls -al"
alias lp="ls -p"
alias lsd='ls -Gl | grep "^d"'
alias reload="source ~/.bash_profile"
alias ..="cd .."
alias ...="cd ../.."
alias update='sudo softwareupdate -i -a; brew update; brew upgrade'
alias ~="cd ~"
alias edit="sublime ."
alias clock='watch -t -n1 "date +%H:%M | figlet -f doh -c -w `tput cols`"'
alias testrw="dd if=/dev/zero bs=1024k of=tstfile count=1024 2>&1 | awk '/sec/ {print $1 / $5 / 1048576, \"MB/sec Write\" }' && purge && dd if=tstfile bs=1024k of=/dev/null count=1024 2>&1 | awk '/sec/ {print $1 / $5 / 1048576, \"MB/sec Read\" }' && rm tstfile"
alias browserstack="java -jar ~/bin/BrowserStackTunnel.jar 8vlzgcB58bVTdLITt514 localhost,80,0"
alias veevastart="git reset --hard HEAD && git pull && git clean -xfd && ant clean && ant globals && ant && ant thumbs && open . && open source/index.html"
alias simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

# weather report
weather(){ curl -s "http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query=${@:-"$1"}"|perl -ne '/<title>([^<]+)/&&printf "\x1B[0;34m%s\x1B[0m: ",$1;/<fcttext>([^<]+)/&&print $1,"\n"';}

# vim
alias vif='mvim -S ~/focus.vim'
alias vimupdate='vim +BundleInstall! +BundleClean +q'
alias gvim='mvim -f -c "au VimLeave * !open -a Terminal"'
alias vime='vim -u ~/.vimrc.encryption.local -x'

# git
alias gm="git mergetool"
alias gc="git commit -m"
alias gca="git commit -am"
alias gs="git status"
alias gb="git branch"
alias gr="git remote"
alias gco="git checkout"

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
PATH=/usr/local/bin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:/usr/local/lib
PATH=${PATH}:/usr/local/mysql/bin
PATH=${PATH}:/usr/X11/bin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/sbin
PATH=${PATH}:/Applications/MacVim-snapshot-66
PATH=${PATH}:~/bin
PATH=${PATH}:.

# Environment Vars
export LSCOLORS=gxfxcxdxbxggedabagacad
export CLICOLOR=1
export VIM_APP_DIR=/Applications/MacVim-snapshot-66

# git-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

if [ -f $HOME/.rvm/scripts/rvm ]; then
	source $HOME/.rvm/scripts/rvm
fi

# Use vim on the command line
set -o vi

# bashrc
if [ -f ~/.bashrc ] ; then
	. ~/.bashrc
fi

export NODE_PATH="/usr/local/lib/node"
NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'

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
#
# For a color list, run ./colors

export DIRECTORY="\033[38;05;222m"
export GIT="\033[38;05;172m"
export PROMPT="\033[38;05;88m"
export RESET="\033[m"

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function ps-1 {
  PS1="\[$DIRECTORY\]\w \[$GIT\]\$(parse_git_branch)\n\[$PROMPT\]\$ \[$RESET\]"
}
ps-1
