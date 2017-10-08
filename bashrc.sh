#!/bin/sh

echo >> ~/.bashrc
echo '# Aliases' >> ~/.bashrc
echo 'alias lh="ls -lh"' >> ~/.bashrc
echo 'alias la="ls -lha"' >> ~/.bashrc
echo 'alias lhn="ls -lhn"' >> ~/.bashrc
echo 'alias cl="clear"' >> ~/.bashrc
echo 'alias f="df -h"' >> ~/.bashrc
echo 'alias cf="clear && df -h"' >> ~/.bashrc
echo 'alias du1="du -hd1"' >> ~/.bashrc
echo 'alias du0="du -hd0"' >> ~/.bashrc
echo 'alias dt="date +%Y%m%d"' >> ~/.bashrc
echo 'alias dtt="date +%Y%m%d.%H%M"' >> ~/.bashrc

echo >> ~/.bashrc
echo '# User' >> ~/.bashrc
echo 'export GOPATH=~/go' >> ~/.bashrc
echo 'export PATH=$PATH:~/bin:$GOPATH/bin:~/.cargo/bin' >> ~/.bashrc
echo 'export PATH="$PATH:$(ruby -e '\''print Gem.user_dir'\'')/bin"' >> ~/.bashrc

