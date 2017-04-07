#!/bin/sh

echo >> ~/.bashrc
echo '# User' >> ~/.bashrc
echo 'export GOPATH=~/go' >> ~/.bashrc
echo 'export PATH=$PATH:~/bin:$GOPATH/bin:~/.cargo/bin' >> ~/.bashrc
echo 'export PATH="$PATH:$(ruby -e '\''print Gem.user_dir'\'')/bin"' >> ~/.bashrc
