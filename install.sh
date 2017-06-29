#!/bin/sh

if [[ "${PWD}" != "/tmp/manjaro-setup" ]]; then
	echo "This script should be run from /tmp/manjaro-setup."
	exit 1
fi

./sudo.sh
./bashrc.sh
source ~/.bashrc
./util.sh
./git.sh
./docker.sh
./go.sh
./ruby.sh
./vim.sh
./thunar.sh
./office.sh
./printers.sh
./install-battmon.sh
