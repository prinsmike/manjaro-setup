#!/usr/bin/env bash

# Clean up in case we're re-installing.
rm -rf ~/.config/nvim
sudo rm -f /etc/profile.d/env.sh

mkdir -p ~/.config/nvim/colors
mkdir -p ~/.config/nvim/tmp

if [[ ! -f "/etc/profile.d/env.sh" ]]; then
	sudo touch /etc/profile.d/env.sh
fi

sudo /bin/sh -c 'echo "export EDITOR=vim" >> /etc/profile.d/env.sh'
sudo /bin/sh -c 'echo "export VISUAL=vim" >> /etc/profile.d/env.sh'

# Install nvim config.
if [[ ! -d "~/.config/nvim" ]]; then
	mkdir -p ~/.config/nvim
fi
cp ./nvim/init.vim ~/.config/nvim/init.vim

# Color scheme.
cp ./molokai.vim ~/.config/nvim/colors/

# Install neovim with python plugins.
sudo pacman --noconfirm -S neovim python2-neovim python-neovim

# Install gocode
go get -u github.com/nsf/gocode

# Install Plug
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins.
nvim +PlugInstall +qall!

# Install deoplete.
nvim +UpdateRemotePlugins +qall!

# Install Go tools
nvim +GoInstallBinaries +qall!
