#!/bin/bash
# Install and setup zsh/ohmyzsh
echo "Installing zsh"
sudo apt install -y zsh
echo "done"

echo "Trying to make zsh the default shell"
chsh -s $(which zsh)
echo "Shell is now..."
echo $SHELL

echo "Copying .profile for zsh"
cp $HOME/.profile $HOME/.zprofile
echo "done"

echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "done"

