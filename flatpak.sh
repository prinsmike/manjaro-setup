#!/usr/bin/env bash

sudo pacman --noconfirm -S flatpak

sudo pacman --noconfirm -S --asdeps --needed elfutils patch
