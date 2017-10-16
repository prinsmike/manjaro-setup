#!/bin/sh

sudo pacman --noconfirm -S virtualbox virtualbox-guest-iso

sudo pacman --noconfirm -S virtualbox-host-modules-arch

yaourt --noconfirm -S virtualbox-ext-oracle
