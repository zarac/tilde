#!/bin/sh
#
# Usage
#	./adduser.sh <username>
#
# Function
#	Creates a user with some shares and an apache2 vhost file.
#
# Author
#	Hannes Landstedt
#
# ToDo
#	Check if mount --bind exists before creating, otherwise it duplicates.. =/
#
# ToDo
#	Create apache vhost
#
# Last Updated
#	20090603
#

USERNAME=$1

SPATH="/mnt/slask/shared/"

#adduser "$USERNAME"

## Add user to shared groups...
#adduser -v "$USERNAME" shared
mkdir -V /home/"$USERNAME"/shared
mount -v --bind "$SPATH" /home/"$USERNAME"/shared

adduser -v "$USERNAME" s-music
mkdir -V "$SPATH"music/"$USERNAME"
chown -v "$USERNAME":s-music "$SPATH"music/"$USERNAME"
chmod -v o-rwx "$SPATH"music/"$USERNAME"

adduser -v "$USERNAME" s-pictures
mkdir -V "$SPATH"pictures/"$USERNAME"
chown -v "$USERNAME":s-stuff "$SPATH"pictures/"$USERNAME"
chmod -v o-rwx "$SPATH"pictures/"$USERNAME"

adduser -v "$USERNAME" s-stuff
mkdir -V "$SPATH"stuff/"$USERNAME"
chown -v "$USERNAME":s-stuff "$SPATH"pictures/"$USERNAME"
chmod -v o-rwx "$SPATH"stuff/"$USERNAME"

## Check first if the template file exists...
#cp /etc/apache2/sites-available/template /etc/apache2/sites-available/"$USERNAME"
#nano /etc/apache2/sites-available/"$USERNAME"
#ln -s /etc/apache2/sites-available/"$USERNAME" /etc/apache2/sites-enabled/"$USERNAME"
#a2ensite /etc/apache2/sites-available/"$USERNAME"
#apache2ctl graceful

#echo "Don't forget to add the user to sshd_config if he should have ssh access."

#EOF
