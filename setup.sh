#!/usr/bin/env bash

set -e

# Get absolute path to directory where this script resides
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Packages
echo "️⚙️Installing Packages"
sudo apt update && sudo apt upgrade -y
sudo apt remove --purge firefox -y

## APTS
sudo apt install vim tmux git curl zsh python3 python3-venv python3-pip -y
sudo apt install bspwm picom polybar
sudo apt install xdotool # (required for rofimoji to type)

## SNAPS
sudo snap install discord 1password

# Font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv

# Default Apps
echo "Configuring Default Apps..."
xdg-settings set default-web-browser chromium_chromium.desktop
xdg-mime default chromium_chromium.desktop x-scheme-handler/http
xdg-mime default chromium_chromium.desktop x-scheme-handler/https

# PYTHON SETUP
echo "Setting up Python3"
mkdir -p ~/Venvs/
python3 -m venv ~/Venvs/main
~/Venvs/main/bin/python3 -m pip install -U pip
~/Venvs/main/bin/python3 -m pip install -U pywal ipython rofimoji gemini-cli

#=========================#
#       CONFIG FILES      #
#=========================#
echo "️️⚙️Setting up config files..."
ln -sf "$SCRIPT_DIR/zshrc" ~/.zshrc
ln -sf "$SCRIPT_DIR/tmux.conf" ~/.tmux.conf

mkdir -p ~/.config/bspwm/
ln -sf "$SCRIPT_DIR/config/bspwm/bspwmrc" ~/.config/bspwm/bspwmrc
mkdir -p ~/.config/sxhkd/
ln -sf "$SCRIPT_DIR/config/sxhkd/sxhkdrc" ~/.config/sxhkd/sxhkdrc
mkdir -p ~/.config/picom/
ln -sf "$SCRIPT_DIR/config/picom/picom.conf" ~/.config/picom/picom.conf
mkdir -p ~/.config/lazygit/
ln -sf "$SCRIPT_DIR/config/lazygit/config.yml" ~/.config/lazygit/config.yml

# Neovim
mkdir -p ~/.config/nvim/lua/config ~/.config/nvim/lua/plugins
ln -sf "$SCRIPT_DIR/config/nvim/lua/config/keymaps.lua" ~/.config/nvim/lua/config/keymaps.lua
ln -sf "$SCRIPT_DIR/config/nvim/lua/plugins/telescope.lua" ~/.config/nvim/lua/plugins/telescope.lua
ln -sf "$SCRIPT_DIR/config/nvim/lua/plugins/gemini.lua" ~/.config/nvim/lua/plugins/gemini.lua
