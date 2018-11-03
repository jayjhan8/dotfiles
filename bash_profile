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
alias ops='cd /Users/jayh/proj/ops'
alias kwm='/usr/local/opt/kwm/kwm'
alias proj='cd /Users/jayh/proj'
alias sw='cd /Users/jayh/proj/statwing/swproxy'
alias tst='cd /Users/jayh/tst'
alias interviews='cd /Users/jayh/tst/interviews'
alias drive='cd /Volumes/My\ Passport'
alias chrome='open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias useful='open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome ~/useful.md'
echo 'coffee dude coffee'

# FZF 
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#PS1="\[\033[31m\]\u:\[\033[36m\]\w\[\033[35m\]\$(parse_git_branch)\[\033[m\]\$(jobscount)$ "
#export PS1
PS1="${PS1}$(jobscount)"
export PS1

export GOPATH="$HOME/go"
#export GOROOT="$HOME/Go"
export PATH=$PATH:$GOPATH/bin

# gov1 scripts
alias gov1f5="echo Tunneling to f5 dashboard in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open http://f5dashboard.gov1.qprod.net:9200 && ssh -L 9200:f5dashboard.gov1.qprod.net:80 -N rampart.gov1.qprod.net"
alias gov1consul="echo Tunneling to consul ui in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open http://consul1-app.gov1.qprod.net:8500/ui && ssh -L 8500:consul1-app.gov1.qprod.net:8500 -N rampart.gov1.qprod.net"
alias gov1grafana="echo Tunneling to grafana dashboard in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open http://metricscassandra1-app.gov1.qprod.net:9202 && ssh -L 9202:metricscassandra1-app:3000 -N rampart.gov1.qprod.net"
alias gov1rundeck="echo Tunneling to rundeck in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open http://rundeck-app.gov1.qprod.net:4440/menu/home && ssh -L 4440:rundeck-app:4440 -N rampart.gov1.qprod.net"
alias gov1teamrundeck="echo Tunneling to team-rundeck in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open https://team-rundeck.gov1.qprod.net:3000 && ssh -L3000:team-rundeck:3000 -L4443:team-rundeck:4443 -L4444:team-rundeck:4444 -L4445:team-rundeck:4445 -L4446:team-rundeck:4446 -L4447:team-rundeck:4447 -L4448:team-rundeck:4448 -L4449:team-rundeck:4449 -L4450:team-rundeck:4450 -L4451:team-rundeck:4451 -L4452:team-rundeck:4452 -L4453:team-rundeck:4453 -L4454:team-rundeck:4454 -L4455:team-rundeck:4455 -N rampart.gov1.qprod.net"
alias gov1ff="echo Tunneling to feature flipper ui in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open http://features.service.gov1.consul:8080 && ssh -L 8080:features.service.gov1.consul:80 -N rampart.gov1.qprod.net"
alias gov1shardmanager="echo Tunneling to shard manager in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open https://gov1-shardmanager.gov1.qprod.net:8087/Qualtrics/Server/ShardManager.php && ssh -L 8087:w1-app:443 -N rampart.gov1.qprod.net"
alias gov1uchiwa="echo Tunneling to uchiwa in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open https://uchiwa-app.gov1.qprod.net:8443 && ssh -L 8443:uchiwa-app:443 -N rampart.gov1.qprod.net"
alias gov1nexpose="echo Tunneling to nexpose in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open https://nexpose-console-app.gov1.qprod.net:49160 && ssh -L 49160:nexpose-console-app:49160 rampart.gov1.qprod.net -N"
alias gov1nomadui="echo Tunneling to nomad-ui in gov1 and opening page in browser. You may need to refresh the page for it to show up. && open https://nomad-ui.gov1.qprod.net:3333/ && ssh -L 3333:nomad1-app:3000 -N rampart.gov1.qprod.net"
# need a more permanent fix
alias qnotary="notary -s https://registry-app.eng.qops.net:4443 -d ~/.docker/trust --tlscacert /tmp/jenkins/jenkins.eng.qops.net.crt"
export PATH="$HOME/.cargo/bin:$PATH"
