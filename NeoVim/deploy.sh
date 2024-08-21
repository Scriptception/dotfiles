#!/bin/bash
#
# This sets up LazyVim according to https://www.lazyvim.org/
#
# IMPORTANT: Please follow the README.md for pre-requisites that can't be scripted before running this script.
#
#
#==================================================#
#                 PRE-REQUISITES                   #
#==================================================#
# 1) Install Neovim
sudo apt remove --purge neovim -y
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod +x ./nvim.appimage
sudo mv ./nvim.appimage /usr/local/bin/nvim -f
#  2) Install Git
sudo apt install git -y
# 3) Install GCC
sudo apt install gcc -y
# 4) Install ripgrep (for live grep searching with Telescope)
sudo apt install ripgrep -y
# 5) Install LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm ./lazygit ./lazygit.tar.gz -f
#
#
#==================================================#
#                     SETUP                        #
#==================================================#
# 1) Cleanup existing Neovim configuration if it exists
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
# 2) Clone LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
# 3) Remove the .git directory
rm -rf ~/.config/nvim/.git
# 4) Copy custom lua plugin configs
cp ./lua/plugins/* ~/.config/nvim/lua/plugins/
# 5) Copy markdownlint config
cp ./markdownlint-cli2.yaml ~/.markdownlint-cli2.yaml
# 6) Add additional settings to init.lua
echo "vim.opt.autochdir = true" >>~/.config/nvim/init.lua
# 7) (OPTIONAL) Create Venv for Python
sudo apt install python3-venv -y
mkdir ~/.venvs
python3 -m venv ~/.venvs/nvim
## 7.1) Install Python dependencies
source ~/.venvs/nvim/bin/activate
pip install -U pip
pip install -U terraform ansible
# 8) Start Neovim!
cd ~/
nvim
