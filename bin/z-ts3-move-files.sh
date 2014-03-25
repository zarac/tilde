#!/bin/sh

cd /var/lib/teamspeak3-server/files/virtualserver_1/
mv $(find . -type f | grep channel_) /shared/shared/ts3uploads/
