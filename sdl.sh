#!/bin/sh

sudo pacman -S sdl2{,_mixer,_image,_ttf}

go get -v github.com/veandco/go-sdl2/sdl{,_mixer,_image,_ttf}
