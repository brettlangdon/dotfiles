#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc config spacemacs emacs.d gitconfig gitignore_global psqlrc zshrc oh-my-zsh tmux.conf"    # list of files/folders to symlink in homedir
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

echo "Setting up virtualenvwrapper"
echo "Creating ~/.env"
mkdir -p ~/.env
echo "Moving postactivate into place"
ln -s $dir/postactivate ~/.env/postactivate

echo "Source ~/.zshrc"
. ~/.zshrc
