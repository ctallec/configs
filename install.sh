#!/bin/bash
CUR_DIR=$(pwd)
DIR=$(cd `dirname $0` && pwd)

cd $DIR
echo "Pulling configs directory"
git pull

# Neovim setup
echo "Setting up Neovim..."
if [[ !( `command -v nvim` ) ]]
then
	echo "Neovim not installed. Exiting."
	exit 125
fi

if [[ !(-d $HOME/.config/nvim) ]]
then
	echo "No neovim configuration directory, creating one."
	mkdir -p $HOME/.config/nvim
fi

echo "Linking configuration files..."
ln -sf $DIR/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $DIR/nvim/general.vim $HOME/.config/nvim/general.vim
ln -sf $DIR/nvim/keys.vim $HOME/.config/nvim/keys.vim
ln -sf $DIR/nvim/line.vim $HOME/.config/nvim/line.vim
ln -sf $DIR/nvim/plug.vim $HOME/.config/nvim/plug.vim
ln -sf $DIR/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json

if [[ !(-d $HOME/.config/nvim/bundle/vim-snippets) ]]
then
	echo "No snippet directory found, creating one."
	mkdir -p $HOME/.config/nvim/bundle/vim-snippets
fi

echo "Linking UltiSnips directory..."
rm -r $HOME/.config/nvim/bundle/vim-snippets/UltiSnips
ln -sf $DIR/nvim/UltiSnips $HOME/.config/nvim/bundle/vim-snippets/UltiSnips

nvim +PlugInstall +PlugUpdate +UpdateRemotePlugins +qall

# Tmux configuration
echo "Setting up Tmux"
if [[ !( `command -v tmux` ) ]]
then
	echo "Tmux not installed. Exiting."
	exit 125
fi

ln -sf $DIR/tmux/tmux.conf $HOME/.tmux.conf
tmux source-file ~/.tmux.conf

# zsh configuration
echo "Setting up zsh"
ln -sf $DIR/zsh/zaddons $HOME/.zaddons
ln -sf $DIR/zsh/zfunctions $HOME/.zfunctions

echo "Check that you are actually sourcing zaddons in your .zshrc"
echo "[ -f $HOME/.zaddons ] && source $HOME/.zaddons"

# linters config
echo "Setting up linters"
if  [[ !(-d $HOME/.config/mypy) ]]
then
	mkdir -p $HOME/.config/mypy
fi
ln -sf $DIR/linters/mypy $HOME/.config/mypy/config
ln -sf $DIR/linters/flake8 $HOME/.config/flake8
ln -sf $DIR/linters/pycodestyle $HOME/.config/pycodestyle
