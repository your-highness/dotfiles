##############################################################################
###### aliases for bash to be defined here       #############################
##############################################################################

alias lp='/bin/ls' # for piping
alias ls='ls --color' #-F'
alias ll='ls -alFh'
alias la='ls -Ah'
alias lq='ls -ltrh'
alias lS='ls -lSrh'
alias l='ls -CFh'

alias tree='tree -aughD'

alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

alias rgrep='grep -r'
alias vgrep='grep -v'

alias xterm="xterm -e screen"

alias ssh="ssh -Y"
alias ssh-mpi="ssh -Y helmuth@geniux.molgen.mpg.de"

alias eclipse="eclipse -vmargs -Xmx512M"
alias gterm="gnome-terminal"
alias ooffice="/opt/openoffice.org3/program/soffice"
alias remv-backups="find . -name \"*~\" | xargs rm -f"
alias remv-bkps='find . -name "*~" | xargs rm'

alias xfce="startxfce4"

alias apt-upgrade="sudo apt-get update && sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoclean"

alias R-dev="~/R-devel/bin/R"
alias rIDE="screen -c ~/.screenrcR"
alias rIDEBiv="export WSPATH=\"Bivalent.domains\"; screen -c ~/.screenrcRremote -S $WSPATH"
alias rIDENano="export WSPATH=\"Nanopore.seq\"; screen -c ~/.screenrcRremote -S $WSPATH"


alias wqstat="watch -n .5 \"qstat -a | sort -k 10 | tail -25\""

alias diskusage="DATE=\$(date +\"%F\") && sudo /opt/conda/miniconda3/envs/mol-routine/bin/ktImportDiskUsage -o ~/\${DATE}_DiskUsage-Krona.html / && sudo chown helmuth:helmuth ~/\${DATE}_DiskUsage-Krona.html"

#This was set by sudo apt-get install android-tools-adb android-tools-fastboot. I have to comment it and the programs work
#alias adb="/opt/android-sdk/platform-tools/adb"
#alias fastboot="/opt/android-sdk/platform-tools/fastboot"
