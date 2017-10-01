#!/bin/sh

sudo pacman --noconfirm -Sy manjaro-printer gutenprint foomatic-db-gutenprint-ppds sane xsane xsane-gimp

sudo systemctl enable org.cups.cupsd.service
sudo systemctl start org.cups.cupsd.service
