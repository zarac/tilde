#!/bin/env sh

rsync -av --copy-unsafe-links ~/.config/backitup/ zarac.se:/srv/backup/tweek/
#rsync -avL /srv/{git,home,http,image,music,slask,sound,video} zarac.se:/srv/backup/tweek/
