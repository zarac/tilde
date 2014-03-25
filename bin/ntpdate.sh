#!/bin/sh
#
# Author
#   Hannes Landstedt a.k.a. zarac

/usr/bin/ntpdate se.pool.ntp.org 2>&1 >> /var/log/ntpdatecron.log
