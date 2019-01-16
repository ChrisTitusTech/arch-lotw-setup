#!/bin/bash

###############################################################################

### Installing Arch Software By: ###

### Erik Sundquist ###

###############################################################################

### Review and edit before using ###

###############################################################################



set -e

clear



echo "################################################################################"

echo "### Installing Accessories applications ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps playonlinux

sudo pacman -S --noconfirm --needed --asdeps winetricks



clear



echo "################################################################################"

echo "### Installing Audio/Video applications ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps audacity

sudo pacman -S --noconfirm --needed --asdeps clementine

sudo pacman -S --noconfirm --needed --asdeps easytag

sudo pacman -S --noconfirm --needed --asdeps handbrake

sudo pacman -S --noconfirm --needed --asdeps kdenlive

sudo pacman -S --noconfirm --needed --asdeps obs-studio

sudo pacman -S --noconfirm --needed --asdeps openshot

sudo pacman -S --noconfirm --needed --asdeps vlc

sudo pacman -S --noconfirm --needed --asdeps shotcut



clear



echo "################################################################################"

echo "### Installing Graphics applications ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps blender

sudo pacman -S --noconfirm --needed --asdeps darktable

sudo pacman -S --noconfirm --needed --asdeps dia

sudo pacman -S --noconfirm --needed --asdeps gimp

sudo pacman -S --noconfirm --needed --asdeps inkscape

sudo pacman -S --noconfirm --needed --asdeps krita

sudo pacman -S --noconfirm --needed --asdeps librecad

sudo pacman -S --noconfirm --needed --asdeps luminancehdr

sudo pacman -S --noconfirm --needed --asdeps cura

yay -S --noconfirm --needed --asdeps makemkv

#yay -S --noconfirm --needed --asdeps popcorntime-bin

yay -S --noconfirm --needed --asdeps drawio-desktop



clear



echo "################################################################################"

echo "### Installing Internet applications ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps firefox

sudo pacman -S --noconfirm --needed --asdeps hexchat

sudo pacman -S --noconfirm --needed --asdeps remmina

sudo pacman -S --noconfirm --needed --asdeps syncthing-gtk

sudo pacman -S --noconfirm --needed --asdeps teamspeak3

sudo pacman -S --noconfirm --needed --asdeps telegram-desktop

sudo pacman -S --noconfirm --needed --asdeps transmission-gtk

sudo pacman -S --noconfirm --needed --asdeps firefox-adblock-plus

sudo pacman -S --noconfirm --needed --asdeps firefox-extension-privacybadger

sudo pacman -S --noconfirm --needed --asdeps steam

sudo pacman -S --noconfirm --needed --asdeps steam-native-runtime

#yay -S --noconfirm --needed --asdeps discord

yay -S --noconfirm --needed --asdeps zoom



clear



echo "################################################################################"

echo "### Installing Office applications ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps homebank

sudo pacman -S --noconfirm --needed --asdeps planner

sudo pacman -S --noconfirm --needed --asdeps libreoffice-fresh



clear



echo "################################################################################"

echo "### Installing System Tool applications ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps cool-retro-term

sudo pacman -S --noconfirm --needed --asdeps dconf-editor

sudo pacman -S --noconfirm --needed --asdeps virtualbox

sudo pacman -S --noconfirm --needed --asdeps pacmanlogviewer

sudo pacman -S --noconfirm --needed --asdeps exfat-utils

sudo pacman -S --noconfirm --needed --asdeps meld

yay -S --noconfirm --needed --asdeps mintstick

yay -S --noconfirm --needed --asdeps virtualbox-ext-oracle

yay -S --noconfirm --needed --asdeps isomaster



clear



echo "################################################################################"

echo "### Installing programming applications ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps rust rust-docs rust-racer lib32-rust eclipse-rust uncrustify

sudo pacman -S --noconfirm --needed --asdeps atom



clear



echo "################################################################################"

echo "### Installing Themes/Icons/Pointers ###"

echo "################################################################################"



sleep 2



sudo pacman -S --noconfirm --needed --asdeps adapta-gtk-theme

sudo pacman -S --noconfirm --needed --asdeps arc-gtk-theme

sudo pacman -S --noconfirm --needed --asdeps arc-icon-theme

sudo pacman -S --noconfirm --needed --asdeps arc-solid-gtk-theme

sudo pacman -S --noconfirm --needed --asdeps awesome-terminal-fonts

sudo pacman -S --noconfirm --needed --asdeps breeze-gtk

sudo pacman -S --noconfirm --needed --asdeps breeze-icons

sudo pacman -S --noconfirm --needed --asdeps deepin-gtk-theme

sudo pacman -S --noconfirm --needed --asdeps deepin-icon-theme

sudo pacman -S --noconfirm --needed --asdeps deepin-sound-theme

sudo pacman -S --noconfirm --needed --asdeps elementary-icon-theme

sudo pacman -S --noconfirm --needed --asdeps gnome-icon-theme

sudo pacman -S --noconfirm --needed --asdeps gnome-icon-theme-extras

sudo pacman -S --noconfirm --needed --asdeps gnome-icon-theme-symbolic

sudo pacman -S --noconfirm --needed --asdeps materia-gtk-theme

sudo pacman -S --noconfirm --needed --asdeps numix-gtk-theme

sudo pacman -S --noconfirm --needed --asdeps oxygen-gtk2

sudo pacman -S --noconfirm --needed --asdeps oxygen-icons

sudo pacman -S --noconfirm --needed --asdeps oxygen-icons-svg

sudo pacman -S --noconfirm --needed --asdeps papirus-icon-theme

sudo pacman -S --noconfirm --needed --asdeps xcursor-bluecurve

sudo pacman -S --noconfirm --needed --asdeps xcursor-comix

sudo pacman -S --noconfirm --needed --asdeps xcursor-flatbed

sudo pacman -S --noconfirm --needed --asdeps xcursor-neutral

sudo pacman -S --noconfirm --needed --asdeps xcursor-premium

sudo pacman -S --noconfirm --needed --asdeps xcursor-simpleandsoft

sudo pacman -S --noconfirm --needed --asdeps xcursor-themes

sudo pacman -S --noconfirm --needed --asdeps xcursor-vanilla-dmz-aa

sudo pacman -S --noconfirm --needed --asdeps xcursor-vanilla-dmz

yay -S --noconfirm --needed --asdeps flat-remix-git

yay -S --noconfirm --needed --asdeps flat-remix-gtk-git

yay -S --noconfirm --needed --asdeps yaru-sound-theme

yay -S --noconfirm --needed --asdeps ecliz-arch

yay -S --noconfirm --needed --asdeps numix-icon-theme-git

yay -S --noconfirm --needed --asdeps numix-circle-icon-theme-git

yay -S --noconfirm --needed --asdeps numix-circle-arc-icons-git

yay -S --noconfirm --needed --asdeps macos11-gtk-theme

yay -S --noconfirm --needed --asdeps macos11-icon-theme

yay -S --noconfirm --needed --asdeps mcos-mjv-dark-mode-gtk-theme

yay -S --noconfirm --needed --asdeps mcos-mjv-gtk-theme

yay -S --noconfirm --needed --asdeps osx-el-capitan-theme-git

yay -S --noconfirm --needed --asdeps sound-theme-smooth

yay -S --noconfirm --needed --asdeps suru-plus-git

yay -S --noconfirm --needed --asdeps xcursor-maia-git

yay -S --noconfirm --needed --asdeps xcursor-numix

yay -S --noconfirm --needed --asdeps xcursor-osx-elcap

# yay -S --noconfirm --needed --asdeps xcursor-theme-wii - Link down

yay -S --noconfirm --needed --asdeps xcursor-pinux-arch



clear



echo "################################################################################"

echo "### Installing of applications completed ###"

echo "################################################################################"

