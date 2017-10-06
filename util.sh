#!/bin/sh

# iostat
sudo pacman -S sysstat htop lsof iotop zip unzip bash-completion thunar

sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl

sudo chmod a+rx /usr/local/bin/youtube-dl

yaourt --noconfirm -S google-cloud-sdk
