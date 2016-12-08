#!/bin/sh

sudo pacman --noconfirm -S evince calibre pandoc

sed -i 's/qpdfview/evince/g' ~/.config/mimeapps.list
