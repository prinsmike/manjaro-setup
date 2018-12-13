#!/bin/sh

# iostat
sudo pacman --noconfirm -S sysstat htop lsof iotop zip unzip bash-completion pwgen jq

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl

sudo chmod a+rx /usr/local/bin/youtube-dl

sudo ln /usr/local/bin/youtube-dl /usr/local/bin/yd

