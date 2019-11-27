#!/bin/bash
parse_git_branch() {
    var=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
      git branch &> /dev/null
      rc=$?
      if [ $rc -ne 0 ]; then
        echo""
      else
        echo " ==>$var"
      fi
}

jobscount() {
    stopped=$(jobs -sp | wc -l | tr -d ' ')
    running=$(jobs -rp | wc -l | tr -d ' ')
    ((running+stopped)) && echo -n " (${running}r/${stopped}s)"
}

alias ls='ls -GFh'
alias ops='cd $HOME/work/ops'
alias kwm='/usr/local/opt/kwm/kwm'
alias work='cd $HOME/work'
alias sw='cd $HOME/work/statwing/swproxy'
alias tst='cd $HOME/tst'
alias interviews='cd $HOME/interviews'
alias drive='cd /Volumes/My\ Passport'
alias chrome='open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias useful='open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome ~/useful.md'
echo '1%'

# FZF 
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#PS1="\[\033[31m\]\u:\[\033[36m\]\w\[\033[35m\]\$(parse_git_branch)\[\033[m\]\$(jobscount)$ "
#export PS1

#PS1="${PS1}$(jobscount)"
#export PS1

export GOPATH="$HOME/go"
#export GOROOT="$HOME/Go"
export PATH=$PATH:$GOPATH/bin:$HOME/bin:/usr/local/bin:/usr/local/opt

export NVM_DIR=$HOME/.nvm

# Qualtrics Specific
source $HOME/.qualtrics_profile
