#!/bin/bash
############################
# setup.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="emacs.d gitconfig gitignore_global psqlrc sqliterc zshrc.d zshrc"    # list of files/folders to symlink in homedir
config_dir="~/.config/"
config_files="starship.toml"  # list of files for ~/config/
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
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# put starship.toml in place
mkdir -p "$config_dir"
for file in $config_files; do
    if [ -e $file ]
    then
        echo "Creating symlink to $file in ~/.config/"
        ln -s $dir/starship.toml $config_dir/starship.toml
    fi
done

echo "Source ~/.zshrc"
. ~/.zshrc
