#!/usr/bin/env bash

# Copy nvim config to dotfiles
if cp ~/.config/nvim/init.vim ~/dotfiles/nvim/init.vim ; then
	echo "Nvim settings copied to dotfiles"
else
	echo "Couldn't copy nvim settings to dotfiles"
fi

# Push changes
if git add . && \
   git commit -m "Settings updated" && \
   git push
then
	echo "Changes pushed"
else
	echo "Something went wrong with git"
fi

