#!/bin/sh

echo >> ~/.bashrc
echo '# Aliases' >> ~/.bashrc
echo 'alias lh="ls -lh"'
echo 'alias la="ls -lha"'
echo 'alias lhn="ls -lhn"'
echo 'alias cl="clear"'
echo 'alias f="df -h"'
echo 'alias cf="clear && df -h"'
echo 'alias du1="du -hd1"'
echo 'alias du0="du -hd0"'

echo >> ~/.bashrc
echo '# User' >> ~/.bashrc
echo 'export GOPATH=~/go' >> ~/.bashrc
echo 'export PATH=$PATH:~/bin:$GOPATH/bin:~/.cargo/bin' >> ~/.bashrc
echo 'export PATH="$PATH:$(ruby -e '\''print Gem.user_dir'\'')/bin"' >> ~/.bashrc
