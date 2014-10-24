#!/bin/bash -i

# A Quick and Dirty Install file for Ironcode Vim configuration

# clone the project repo
git clone https://github.com/salcode/ironcode-vim.git ~/ironcode-vim

# make backups of current config
mv ~/.gvimrc ~/.gvimrc.bkup
mv ~/.vimrc ~/.vimrc.bkup

# note: if .vim-bkup exists, this puts .vim/ inside it
mv ~/.vim ~/.vim-bkup

# link to config in ~/ironcode-vim/
ln -sf ~/ironcode-vim/gvimrc.vim ~/.gvimrc
ln -sf ~/ironcode-vim/vimrc.vim ~/.vimrc
ln -sfh ~/ironcode-vim ~/.vim

# install vundle
git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/vundle

# run vim and install plugins
vim +PluginInstall +qall
