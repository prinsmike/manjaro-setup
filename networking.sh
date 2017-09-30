#!/bin/sh

sudo pacman -S samba

sudo wget "https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD" -O /etc/samba/smb.conf

sudo systemctl enable smbd.service
sudo systemctl start smbd.service
