#!/bin/sh

if [[ "${PWD}" != "/tmp/manjaro-setup" ]]; then
	echo "This script should be run from /tmp/manjaro-setup."
	exit 1
fi

~/scripts/install/sudo.sh
~/scripts/install/bashrc.sh
source ~/.bashrc
~/scripts/install/go.sh
~/scripts/install/vim.sh
