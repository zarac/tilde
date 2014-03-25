#!/bin/sh
#
# very simple rsync backup script made by zarac
# meant to be run as a cronjob
# last updated 0710180313

# LOG FILENAME
LOGFILE=`date +%Y%m%d%H%M%S`.log

# LOG DIRECTORY
LOGDIR='/root/scripts/.rsyncbackup/'

# EXCLUDE STRING (format: '--exclude=upload/ --exclude=ftp/')
EXCLUDE='--exclude=upload/ --exclude=shared/'

# WHAT DIRECTORIES / FILES TO BACKUP. REMEMBER, NO TRAILING SLASH ON DIRECTORIES!
BUSOURCE='/home /etc /root /var/log'

# BACKUP DESTINATION
BUDEST='/mnt/hdc/backup'

rsync -vurpogthlx --delete --delete-excluded --stats $EXCLUDE $BUSOURCE $BUDEST > $LOGDIR$LOGFILE
