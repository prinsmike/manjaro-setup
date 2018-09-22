#!/bin/sh

if [[ "${PWD}" != "/tmp/manjaro-setup" ]]; then
	echo "This script should be run from /tmp/manjaro-setup."
	exit 1
fi

./first.sh
./sudo.sh
./bashrc.sh
source ~/.bashrc
./Xresources.sh
./dev.sh
#./flatpak.sh
./util.sh
./git.sh
./docker.sh
#./kvm.sh
./virtualbox.sh
./go.sh
./vim.sh
./vs-code.sh
./thunar.sh
./graphics
./office.sh
./printers.sh
./audio.sh
./book.sh
./thunar.sh
./postman.sh
./weechat.sh
./palemoon.sh
./i3/install.sh
./i3status/install.sh
