#!/bin/sh

if [[ "${PWD}" != "/tmp/manjaro-setup" ]]; then
	echo "This script should be run from /tmp/manjaro-setup."
	exit 1
fi

mkdir -p ~/.vim/bundle ~/.vim/colors

sudo pacman --noconfirm -S vim ctags

sudo /bin/sh -c 'echo "export EDITOR=vim" >> /etc/profile.d/env.sh'

cp ./.vimrc ~/.vimrc
cp ./molokai.vim ~/.vim/colors

# Build YouCompleteMe
git clone --depth 1 https://github.com/Valloric/YouCompleteMe.git \
	~/.vim/bundle/YouCompleteMe/ && \
	echo "Changing to YouCompleteMe directory." && \
	cd ~/.vim/bundle/YouCompleteMe && \
	pwd && \
	git submodule update --init --recursive && \
	~/.vim/bundle/YouCompleteMe/install.py --gocode-completer && \
	echo "Changing back to /tmp/manjaro-setup." && \
	cd /tmp/manjaro-setup && \
	pwd

# Install Vundle and plugins
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle && \
	vim +PluginInstall +qall!
