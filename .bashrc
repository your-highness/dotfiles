# ~/.bashrc: executed by bash(1) for non-login shells.
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
HISTSIZE=15000
HISTFILESIZE=15000

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
    xterm-color|*-256color) color_prompt=yes;;
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


####
#PROMPT
####
export PROMPT_COMMAND='DIR=`pwd|sed -e "s!$HOME!~!"`; if [ ${#DIR} -gt 50 ]; then CurDir=${DIR:0:20}...${DIR:${#DIR}-20}; else CurDir=$DIR; fi'
if [ "$color_prompt" = yes ]; then
  PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\$CurDir\[\033[00m\]>"
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\$CurDir>'
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

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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


####
# EXPORTS
####
#Default date format
export HISTTIMEFORMAT='%F %a %T %t'
#Pager config
export PAGER='less'
export LESS='-MiRXS'
#VIM is default editor
export EDITOR='vim'
#Perl
export PATH="/home/helmuth/perl5/bin${PATH:+:${PATH}}"
export PERL5LIB="/home/helmuth/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"
export PERL_LOCAL_LIB_ROOT="/home/helmuth/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"
export PERL_MB_OPT="--install_base \"/home/helmuth/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/helmuth/perl5"
#Java
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
export JAVA_TOOL_OPTIONS+=" -Djava.net.useSystemProxies=true"
#Python
export PYTHONSTARTUP=~/.pythonrc


####
# HISTORY
####
HISTCONTROL=erasedups:ignorespace
#Use up and down keys to search history :)
bind '"\e[A"':history-search-backward
bind '"\e[B"':history-search-forward


####
# COLORS
####
LS_COLORS="ow=01;34:di=01;34:ln=01;36:ex=01;32"


####
# FUNCTIONS
####
#Auto completion for known hosts
SSH_COMPLETE=$(cut -f1 -d' ' ~/.ssh/known_hosts |\
                 tr ',' '\n' |\
                 sort -u |\
                 grep -e '[[:alpha:]]')
complete -o default -W "${SSH_COMPLETE[*]}" ssh
#Move up $depth dirs
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
#Remove dependencies build by apt-get build-deps $1
function remove-build-deps {
  sudo aptitude markauto $(apt-cache showsrc $1 | sed -e '/Build-Depends/!d;s/Build-Depends: \|,\|([^)]*),*\|\[[^]]*\]//g')
  sudo apt-get autoremove
}


####
# FZF - Commandline fuzzy finder
# Install for current user via: 
#   git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
#   ~/.fzf/install
####
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--height=75% --min-height=10 --layout=reverse-list --multi --info=inline --tabstop=2 --history-size=15000 --preview='head -100 {}' --preview-window=right:50% --color='fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window right:50%:wrap"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"


####
# CONDA SETUP (managed by conda init)
####
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export -f conda
export -f __conda_activate
export -f __conda_reactivate
export -f __conda_hashr
export -f __add_sys_prefix_to_path
