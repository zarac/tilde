#!/bin/sh

URL=$1

A=`curl -v $URL 2>&1 | grep '< HTTP' | awk '{print $3}'`
echo $A

#if [[ $A =~ 404 ]]; then
  #echo '404'
#elif [[ $A =~ 502 ]]; then
  #echo '502'
#else
  #echo '???'
#fi
