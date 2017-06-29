#!/bin/sh

UPATH=~/.config/systemd/user

if [ ! -d "$UPATH" ]; then
	mkdir -p $UPATH
fi

sudo cp ./battmon.sh /usr/local/bin/battmon
cp ./battmon.timer ./battmon.service $UPATH

systemctl --user enable battmon.timer
systemctl --user start battmon.timer

systemctl --user daemon-reload
