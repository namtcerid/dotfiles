#!/bin/sh

ln -sf ~/dotfiles/.vimrc ~/.vimrc

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein
