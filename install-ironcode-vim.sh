#!/bin/bash -i

# A Quick and Dirty Install file for Ironcode Vim configuration

# clone the project repo
git clone https://github.com/salcode/ironcode-vim.git ~/ironcode-vim

# make backups of current config
mv ~/.gvimrc ~/.gvimrc.bkup
mv ~/.vimrc ~/.vimrc.bkup

# create backup of .vim/ folder, overwrite if it exists
rm -rf ~/.vim.bkup
mv ~/.vim ~/.vim.bkup

# link to config in ~/ironcode-vim/
ln -sf ~/ironcode-vim/init.vim ~/.vimrc
ln -sfh ~/ironcode-vim ~/.vim

# run vim and install plugins
vim +PlugInstall +qall
