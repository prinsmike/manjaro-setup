#!/bin/sh

sudo pacman --noconfirm -S docker && \
	sudo gpasswd -a ${USER} docker

sudo sed --in-place \
	's/^ExecStart=.*/ExecStart=\/usr\/bin\/dockerd -H tcp:\/\/0.0.0.0:4243 -H unix:\/\/\/var\/run\/docker.sock/' \
	/usr/lib/systemd/system/docker.service

sudo systemctl start docker.service && \
	sudo systemctl enable docker.service

sudo systemctl daemon-reload
