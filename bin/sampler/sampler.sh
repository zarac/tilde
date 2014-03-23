#!/bin/sh
#
# usage
#   sampler.sh <type>
#   sampler.sh -l <type>
#
#   <type>
#     files in ./types/<type>.sh
#
#   samples are collected as ./samples/<type>.log


## sampler's root directory
cd ~/scripts/sampler

## set parameters
list=false
type=$1
if [ $type == '-l' ]; then
  list=true
  type=$2
fi

if [ $list == true ]; then
  #echo "listing $type"
  cat samples/${type}.log
else
  #echo "sampling $type"
  command="sh types/${type}.sh"
  out=`$command`
  outfile=samples/$type.log
  echo $out >> $outfile
fi


