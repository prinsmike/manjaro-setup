#!/bin/sh

if [[ "${PWD}" != "/tmp/manjaro-setup" ]]; then
	echo "This script should be run from /tmp/manjaro-setup."
	exit 1
fi

./sudo.sh
./bashrc.sh
source ~/.bashrc
./go.sh
./vim.sh
./virtualbox.sh
