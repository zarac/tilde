#!/bin/env sh

LOGDIR=~/var/log/battery/
DATE=`date +%Y%m%d%H%M%S`
LOGFILE="${LOGDIR}${DATE}.log"

pwd
echo $LOGFILE

acpi -V > $LOGFILE
ibam -a >> $LOGFILE
