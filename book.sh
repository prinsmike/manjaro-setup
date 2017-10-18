#!/bin/sh

sudo pacman --noconfirm -S evince calibre pandoc

yaourt --noconfirm -S acroread

sed -i 's/epdfview/acroread/g' ~/.config/mimeapps.list
