#!/bin/sh

fqdn=`hostname -f`

header="From: $fqdn <noreply@$fqdn>"

subject="IP-Info. from $fqdn"

to="zarac@zarac.se,zarac.se@gmail.com"


#/sbin/ifconfig | /usr/bin/mail -a "$header" -s "$subject" $to
ip addr | /usr/bin/mail -s "$subject" $to

#/sbin/ifconfig | awk BEGIN { RS="" } /eth/ {print "inet " \$7}
# EOF
