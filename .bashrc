# ~/.bashrc: executed by bash(1) for non-login shells
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#migrated from old archlinux home
PAGER='less'
LESS='-MiRXS'
PS1="\h:\w>"
PATH=$PATH:/home/joei/bin

export LESS PS1 PAGER PATH

umask 066

#shopt -s autocd

# history
HISTCONTROL=erasedups:ignorespace
HISTFILESIZE=1000
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward

# ls
LS_COLORS="ow=01;34:di=01;34:ln=01;36:ex=01;32"

# shorten prompt
export PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 50 ]; then CurDir=${DIR:0:20}...${DIR:${#DIR}-20}; else CurDir=$DIR; fi'
PS1="\h:\$CurDir>"
#window title
#export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# ssh
SSH_COMPLETE=$(cut -f1 -d' ' ~/.ssh/known_hosts |\
                 tr ',' '\n' |\
                 sort -u |\
                 grep -e '[[:alpha:]]')
complete -o default -W "${SSH_COMPLETE[*]}" ssh

SVN_EDITOR='vim'
EDITOR='vim'

PYTHONSTARTUP=~/.pythonrc

#map ESC to CAPS LOCK
setxkbmap -option caps:escape

#VIM is default editor
export VISUAL=VIM
export EDITOR="$VISUAL"

####
# Functions
####
function .. 
{
  depth=$1;
  if [ -z "$1" ];	then
    depth=1;
  fi
  for ((i=0;i<$depth;i+=1)); do
    cd ..
  done
}

function update_display() 
{
  screen ${@} -X stuff "export DISPLAY=${DISPLAY}$(echo -ne '\015')"
}

function update_all_windows() 
{
  # window 0 is VIM, window 4 is htop
  screen ${@} -p 3 -X stuff "Sys.setenv('DISPLAY'='${DISPLAY}')$(echo -ne '\015')"
  for j in 4 5 6 7; do
    update_display -p $j ${@}
  done
}
#Remove dependencies build by apt-get build-deps $1
function remove-build-deps {
  sudo aptitude markauto $(apt-cache showsrc $1 | sed -e '/Build-Depends/!d;s/Build-Depends: \|,\|([^)]*),*\|\[[^]]*\]//g')
  sudo apt-get autoremove
}

