echo "Please choose what you want to do"

options=("New Install (includes basic packages)" "Update")
select option in "${options[@]}"
do
    case $option in
        "New Install (includes basic packages)")
            echo "Beginning config installation...";
            sudo pacman -S git neofetch htop vim man networkmanager brightnessctl otf-aurulent-nerd qtile polybar rofi tlp xorg-xrandr arandr nitrogen; 
            git clone https://github.com/maxlttr/wm.git;
            cp -i ~/wm/qtile/config.py ~/.config/qtile/config.py;
            chmod +x ~/wm/qtile/autostart.sh;
            cp -i ~/wm/qtile/autostart.sh ~/.config/qtile/autostart.sh;
            #Polybar
            mkdir ~/.config/polybar/;
            cp -i ~/wm/polybar/config.ini ~/.config/polybar/config.ini;
            #Wallpaper
            cp -r ~/wm/wallpapers/ ~/.config/;
            #Mouse
            sudo cp -i ~/wm/mouse/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf;
            #sxhkd
            mkdir ~/.config/sxhkd;
            cp -i ~/wm/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc;
            cp -i ~/wm/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc;
            #Clean useless file and folder;
            sudo rm -r ~/wm/ && rm installer.sh; 
            echo "Don't forget to configure TLP before rebooting...";
            read -p "Reboot now? (y/n) " yn;
            case $yn in
                [Yy]* ) reboot;
                        break;;
                [Nn]* ) break;;
            esac
            exit;;
        "Update")
            echo "Beginning config update...";
            git clone https://github.com/maxlttr/wm.git;
            cp -i ~/wm/qtile/config.py ~/.config/qtile/config.py;
            chmod +x ~/wm/qtile/autostart.sh;
            cp -i ~/wm/qtile/autostart.sh ~/.config/qtile/autostart.sh;
            #Polybar
            mkdir ~/.config/polybar/;
            cp -i ~/wm/polybar/config.ini ~/.config/polybar/config.ini;
            #Wallpaper
            cp -r ~/wm/wallpapers/ ~/.config/;
            #Mouse
            sudo cp -i ~/wm/mouse/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf;
            #sxhkd
            mkdir ~/.config/sxhkd;
            cp -i ~/wm/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc;
            cp -i ~/wm/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc;
            #Clean useless file and folder;
            sudo rm -r ~/wm/ && rm installer.sh; 
            echo "Don't forget to configure TLP before rebooting...";
            read -p "Reboot now? (y/n) " yn;
            case $yn in
                [Yy]* ) reboot;
                        break;;
                [Nn]* ) break;;
            esac
            exit;;
    esac
done
