#!/bin/sh

#Basic packages
sudo pacman -S git neofetch htop vim networkmanager otf-aurulent-nerd firefox qtile polybar rofi tlp
#Clone the repo
git clone https://github.com/maxlttr/wm.git
#Polybar
mkdir ~/.config/polybar/
cp -i ~/wm/config.ini ~/.config/polybar/config.ini
#Qtile
cp -i ~/wm/config.py ~/.config/qtile/config.py
chmod +x ~/Downloads/wm/autostart.sh
cp -i ~/wm/autostart.sh ~/.config/qtile/autostart.sh
#Wallpaper
cp -i ~/wm/image.jpg ~/.config/qtile/image.jpg
#Clean useless file and folder
rm -r ~/wm/ && rm installer.sh
reboot
