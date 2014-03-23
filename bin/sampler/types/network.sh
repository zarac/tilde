#!/bin/sh

date=`date +%Y%m%d%H%M%S`

out=`bwm-ng -o csv -c 1 -C' ' | awk '/eth1/{print "{\"date\"=\""'${date}'"\", \"tx\"=\""$3"\", \"rx\"=\""$4"\"}"}'`
echo $out
