#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc emacs emacs.d gitconfig gitignore_global zshrc oh-my-zsh"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    if [ -e $file ]
    then
	echo "Moving $file to $olddir/$file"
	mv ~/.$file $olddir
        echo "Creating symlink to $file in home directory."
        ln -s $dir/$file ~/.$file
    fi
done

echo "Installing Elpy"
sudo pip install elpy rope

echo "Installing Virtualenvwrapper"
sudo pip install virtualenvwrapper

echo "Setting up $WORKON_HOME"
WORKON_HOME=~/environments
mkdir -p $WORKON_HOME
file="postactivate"
if [ -e $file ]
then
    echo "Moving $WORKON_HOME/$file to $olddir/$file"
    mv $WORKON_HOME/$file $olddir
    echo "Creating symlink to $file in $WORKON_HOME directory."
    ln -s $dir/$file $WORKON_HOME/$file
fi

echo "Setting up GOPATH"
mkdir -p $GOPATH

echo "Setting up CHEF_PATH"
mkdir -p $CHEF_PATH

echo "Source ~/.zshrc"
source ~/.zshrc
