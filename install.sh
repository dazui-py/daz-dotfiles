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

pkg update && pkg upgrade -y
pkg install -y x11-repo
pkg install -y termux-x11-nightly xfce4 neofetch unzip curl

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
