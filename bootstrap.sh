#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

# Grab current values before updating scripts
current_git_name=$(git config --global user.name)
current_git_email=$(git config --global user.email)
current_computer_name=$(sudo scutil --get ComputerName)

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

###############################################################################
# Add values the end-user can modify                                          #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
read -p "Enter computer name (press enter to keep [$current_computer_name]): " new_computer_name
if [ -z "$new_name" ]; then
    new_computer_name=$current_computer_name
fi

# Set the new names using sudo
sudo scutil --set ComputerName "$new_computer_name"
sudo scutil --set HostName "$new_computer_name"
sudo scutil --set LocalHostName "$new_computer_name"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$new_computer_name"

# Set the git user
read -p "Enter new git name (press enter to keep [$current_git_name]: " new_git_name
if [ -z "$new_git_name" ]; then
    new_git_name=$current_git_name
fi

git config --global user.name "$new_git_name"

# Set the git email
read -p "Enter new git email or press enter to keep [$current_git_email]: " new_git_email
if [ -z "$new_git_email" ]; then
    new_git_email=$current_git_email
fi

git config --global user.email "$new_git_email"

source ~/.bash_profile;
