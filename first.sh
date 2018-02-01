#!/usr/bin/env bash

# Set the pacman mirrors to South Africa

sudo pacman-mirrors -cSouth_Africa && sudo pacman -Syy
