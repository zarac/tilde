#!/bin/sh
#
# recursive md5sum check
# <
#   directory
# >
#   md5sum of list of md5sum of each file in directory
# ~
#   get list of files
#   get md5sum for each file
#   get md5sum of list of md5sums
# author
#   Hannes Landstedt a.k.a. zarac
##

dir=$1

find $dir -type f -exec md5sum '{}' \; | awk '{print $1}' | sort | md5sum | awk '{print $1}'
