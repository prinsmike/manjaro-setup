#!/usr/bin/env bash

sudo pacman --noconfirm -S flatpak

sudo pacman --noconfirm -S --asdeps --needed elfutils patch

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
