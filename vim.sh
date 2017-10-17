#!/bin/sh

mkdir -p ~/.vim/bundle ~/.vim/colors
mkdir -p ~/.vim/tmp

sudo pacman --noconfirm -S vim clang ctags yaourt

sudo /bin/sh -c 'echo "export EDITOR=vim" >> /etc/profile.d/env.sh'

cp ./.vimrc ~/.vimrc
cp ./molokai.vim ~/.vim/colors

# Install YouCompleteMe
gpg --recv-keys C52048C0C0748FEE227D47A2702353E0F7E48EDB
yaourt -S --noconfirm vim-youcompleteme-git

# Install Vundle and plugins
git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle && \
	vim +PluginInstall +qall!

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
cd -
