#!/bin/sh

read -p "New install ?" yn
case $yn in
        [Yy]* ) sudo pacman -S git neofetch htop vim networkmanager brightnessctl otf-aurulent-nerd firefox qtile polybar rofi tlp xorg-xrandr arandr; 
                git clone https://github.com/maxlttr/wm.git;
                
                #Polybar
                mkdir ~/.config/polybar/;
                cp -i ~/wm/config.ini ~/.config/polybar/config.ini;
               
                #Qtile
                cp -i ~/wm/config.py ~/.config/qtile/config.py;
                chmod +x ~/wm/autostart.sh;
                cp -i ~/wm/autostart.sh ~/.config/qtile/autostart.sh;
               
                #Wallpaper
                cp -i ~/wm/wallpapers/ ~/.config/qtile/wallpapers/;
                
                #Mouse
                sudo cp -i ~/wm/mouse/|etc|X11|xorg.conf.d|30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf;
                
                #Configure TLP
                sudo vim /etc/tlp.conf && firefox -new-tab https://linrunner.de/tlp/settings/introduction.html;
                
                #Clean useless file and folder
                sudo rm -r ~/wm/ && rm installer.sh;
                
                break;;
        [Nn]* ) read -p "Do you wish to update ?" yn
                case $yn in
                        [Yy]* ) git clone https://github.com/maxlttr/wm.git;
                               
                                #Polybar
                                mkdir ~/.config/polybar/;
                                cp -i ~/wm/config.ini ~/.config/polybar/config.ini;
                              
                                #Qtile
                                cp -i ~/wm/config.py ~/.config/qtile/config.py;
                                chmod +x ~/wm/autostart.sh;
                                cp -i ~/wm/autostart.sh ~/.config/qtile/autostart.sh;
                               
                                #Wallpaper
                                cp -i ~/wm/wallpapers/ ~/.config/qtile/wallpapers/;
                               
                                #Mouse
                                sudo cp -i ~/wm/mouse/|etc|X11|xorg.conf.d|30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf;
                               
                                #Clean useless file and folder
                                sudo rm -r ~/wm/ && rm installer.sh;
                                read -p "Reboot now ?" yn
                                case $yn in
                                        [Yy]* ) reboot;
                                        [Nn]* ) exit;;

                
                        [Nn]* ) exit;;
                        
                
                exit;;
        * ) echo "Please answer yes or no.";;
    esac
