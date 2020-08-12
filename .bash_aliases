####
# FILE MANUPILATION (ask for confirmation per default)
####
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'


####
# LS / DIR
####
alias lp='/bin/ls' # for piping
alias ls='ls --color=auto'
alias l='ls -CFh'
alias ll='ls -lFh'
alias la='ls -lAh'
alias lq='ls -ltrh'
alias lS='ls -lSrh'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'


####
# TREE
####
alias tree='tree -aughD'


####
# GREP
####
alias grep='grep --color=auto'
alias rgrep='grep --color=auto -r'
alias vgrep='grep --color=auto -v'


####
# OTHER
####
#ssh: Encrypted X11 forwarding per default
alias ssh="ssh -Y"
#apt: Update shorthand
alias apt-upgrade="sudo apt-get update && sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoclean"
#sge: Watch queue
alias wqstat="watch -n .5 \"qstat -a | sort -k 10 | tail -25\""
#krona: Creat diskusage HTML
alias diskusage="DATE=\$(date +\"%F\") && sudo /opt/conda/miniconda3/envs/mol-routine/bin/ktImportDiskUsage -o ~/\${DATE}_DiskUsage-Krona.html / && sudo chown helmuth:helmuth ~/\${DATE}_DiskUsage-Krona.html"
