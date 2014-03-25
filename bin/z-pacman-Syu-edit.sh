#!/bin/sh
FILES=`find /etc /usr -regex ".*pacnew\|pacsave"`
echo '\\\\ editing' >> /root/scripts/log/pacman.log
echo $FILES >> /root/scripts/log/pacman.log
echo '////' >> /root/scripts/log/pacman.log
vim $FILES
