#!/bin/sh

# vim

mkdir -p ~/.vim/bundle ~/.vim/colors
mkdir -p ~/.vim/tmp

sudo pacman --noconfirm -S vim clang ctags yaourt

sudo /bin/sh -c 'echo "export EDITOR=vim" >> /etc/profile.d/env.sh'

cp ./.vimrc ~/.vimrc
cp ./molokai.vim ~/.vim/colors

# Install Vundle and plugins
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle && \
	vim +PluginInstall +qall!

# neovim

sudo pacman --noconfirm -S neovim
