#!/bin/env sh

rsync -av --copy-unsafe-links --delete ~/.config/backitup/ zarac.se:/srv/backup/tweek/ | tee ~/var/log/backitup/`date +%Y%m%d%H%M`.log
