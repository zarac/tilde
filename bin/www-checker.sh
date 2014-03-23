#!/bin/sh
#
# www-checker.sh
#   check www-status and act accordingly
#
# Author
#   Hannes Landstedt a.k.a. zarac
##

date=`date +%Y%m%d%H%M%S`

wwwcheck () {
  local url=$1
  local dir=$2
  echo $date' - checking : '$url
  status=`~/scripts/www-status.sh $url` 
  if [[ $status == 200 ]]; then
    echo 'up'
  elif [[ $status == 502 ]]; then
    echo 'down - 502'
    tmux new-session -d -s nodes 'ping zarac.se' 2>/dev/null
    tmux new-window -t nodes -n $url "~/scripts/npm-start.sh $dir"
    #tmux rename-window $url
  else
    echo 'down'
  fi
}

tmux new-session -d -s nodes
wwwcheck 'zarac.se' '/shared/zarac/www/zarac.se/www/'
wwwcheck 'crust.zarac.se' '/shared/zarac/www/zarac.se/crust/'
wwwcheck 'see.zarac.se' '/shared/zarac/www/zarac.se/see/'
