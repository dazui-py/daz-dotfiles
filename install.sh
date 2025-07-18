#!/bin/bash

set -e

echo "[+] Starting XFCE4 dotfiles and panel setup..."

DOTFILES_DIR=~/daz-dotfiles

# Check for dotfiles directory
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "[-] Dotfiles directory not found at $DOTFILES_DIR"
    exit 1
fi

echo "[+] Installing required XFCE4 panel plugins and tools..."

sudo apt update
sudo apt install -y \
    xfce4-whiskermenu-plugin \
    xfce4-appmenu-plugin \
    xfce4-notifyd \
    xfce4-pulseaudio-plugin \
    xfce4-indicator-plugin \
    xfce4-systemload-plugin \
    xfce4-datetime-plugin \
    xfce4-places-plugin \
    xfce4-sensors-plugin \
    xfce4-taskmanager \
    xfce4-weather-plugin \
    xfce4-netload-plugin \
    xfce4-cpugraph-plugin \
    xfce4-timer-plugin \
    xfce4-clipman-plugin \
    xfce4-mailwatch-plugin \
    xfce4-dockbarx-plugin \
    xfce4-panel-profiles \
    neofetch \
    unzip \
    curl \
    fonts-firacode

echo "[+] Creating symbolic links for dotfiles..."

mkdir -p ~/.config

ln -sf $DOTFILES_DIR/.assets ~/.assets
ln -sf $DOTFILES_DIR/.icons ~/.icons
ln -sf $DOTFILES_DIR/.fonts ~/.fonts
ln -sf $DOTFILES_DIR/.themes ~/.themes
ln -sf $DOTFILES_DIR/gtk-3.0 ~/.config/gtk-3.0
ln -sf $DOTFILES_DIR/gtk-4.0 ~/.config/gtk-4.0
ln -sf $DOTFILES_DIR/xfce4 ~/.config/xfce4
ln -sf $DOTFILES_DIR/neofetch ~/.config/neofetch

echo "[+] Refreshing font cache..."
fc-cache -fv

echo "[+] Panel plugin installation complete."
echo "[!] You may now configure Panel 2 manually or restore it using xfce4-panel-profiles."

echo "[✓] Setup finished."
