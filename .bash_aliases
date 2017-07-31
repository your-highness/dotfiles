##############################################################################
###### aliases for bash to be defined here		##############################
##############################################################################

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias vgrep='vgrep --color=auto'
fi

alias lp='/bin/ls' # for piping
alias ls='ls --color' #-F'
alias ll='ls -alFh'
alias la='ls -ah'
alias lq='ls -ltrh'
alias lS='ls -lSrh'
alias l='ls -CF'

alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

alias rgrep='egrep -r'
alias vgrep='grep -v'

alias xterm="xterm -e screen"

alias gterm="gnome-terminal"
alias ooffice="/opt/openoffice.org3/program/soffice"
alias remv-backups="find . -name \"*~\" | xargs rm -f"
alias remv-bkps='find . -name "*~" | xargs rm'

#Ubuntu updates
alias apt-upgrade="sudo apt-get update && sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoclean"

alias R-dev="~/R-devel/bin/R"

#GNU screen aliases
alias rIDE="screen -c ~/.screenrcR"
alias rIDEBiv="export WSPATH=\"Bivalent.domains\"; screen -c ~/.screenrcRremote -S $WSPATH"
alias rIDENano="export WSPATH=\"Nanopore.seq\"; screen -c ~/.screenrcRremote -S $WSPATH"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

