#!/usr/bin/env bash

# Copy nvim config to dotfiles
if cp ~/.config/nvim/init.vim ~/dotfiles/nvim/init.vim ; then
	echo "Nvim settings copied to dotfiles"
else
	echo "Couldn't copy nvim settings to dotfiles"
fi

# make sure we are in the right directory
cd ~/dotfiles/nvim
# Push changes
if git add . && \
   # use first argument for commit message
   git commit -m "$1" && \
   git push
then
	echo "Changes pushed"
else
	echo "Something went wrong with git"
fi

