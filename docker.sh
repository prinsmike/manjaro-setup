#!/bin/sh

sudo pacman --noconfirm -S docker && \
	sudo gpasswd -a ${USER} docker

sudo systemctl enable docker.service && \
	sudo systemctl start docker.service

