#!/bin/sh

echo -n "Enter the name for the global git user: "
read gitname

echo -n "Enter the email address for the global git user: "
read gitemail

git config --global user.name $gitname
git config --global user.email $gitemail
git config --global credential.helper 'cache --timeout=43200'
