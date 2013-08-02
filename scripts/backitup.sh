#!/bin/sh
#
# simple rsync backup script
# meant to be run by a cronjob (or something)
#
# Author
#  Hannes Landstedt a.k.a. zarac
##

cd /home/zarac

# LOG FILENAME
LOGFILE=`date +%Y%m%d%H%M%S`.log

# LOG DIRECTORY
LOGDIR='.backitup/'

# EXCLUDE STRING (format: '--exclude=upload/ --exclude=ftp/')
EXCLUDES='--exclude=excludeme/'

# WHAT DIRECTORIES / FILES TO BACKUP. REMEMBER, NO TRAILING SLASH ON DIRECTORIES!
BUSOURCES='.backitup backup gitz my'

# BACKUP DESTINATION
BUDEST='_shared/backup/zarac/zarac-at-stan'

# FLAGS
#--delete                    delete extraneous files from dest dirs
#--delete-excluded           also delete excluded files from dest dirs
#--devices                   preserve device files (super-user only)
#--specials                  preserve special files
#--stats                     give some file-transfer stats
#-A, --acls                  preserve ACLs (implies -p)
#-D                          same as --devices --specials
#-H, --hard-links            preserve hard links
#-X, --xattrs                preserve extended attributes
#-a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
#-g, --group                 preserve group
#-h, --human-readable        output numbers in a human-readable format
#-l, --links                 copy symlinks as symlinks
#-o, --owner                 preserve owner (super-user only)
#-p, --perms                 preserve permissions
#-r, --recursive             recurse into directories
#-t, --times                 preserve modification times
#-u, --update                skip files that are newer on the receiver
#-v, --verbose               increase verbosity
#-x, --one-file-system       don't cross filesystem boundaries
#-z, --compress              compress file data during the transfer
#FLAGS='-vurpogthlx'
FLAGS='-azvhx'


# Fire!
TIMESTART=`date +%Y%m%d%H%M%S`
echo '[ START TIME ] - ' $TIMESTART > $LOGDIR$LOGFILE
rsync $FLAGS --delete --delete-excluded --stats $EXCLUDES $BUSOURCES $BUDEST >> $LOGDIR$LOGFILE
TIMEEND=`date +%Y%m%d%H%M%S`
echo '[ END TIME ] - ' $TIMEEND >> $LOGDIR$LOGFILE

#EOF
