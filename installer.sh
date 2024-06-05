#!/bin/sh

config_setup () {
    git clone https://github.com/maxlttr/wm.git
    cp -i ~/wm/qtile/config.py ~/.config/qtile/config.py
    chmod +x ~/wm/qtile/autostart.sh
    cp -i ~/wm/qtile/autostart.sh ~/.config/qtile/autostart.sh
    #Polybar
    mkdir ~/.config/polybar/
    cp -i ~/wm/polybar/config.ini ~/.config/polybar/config.ini
    #Alacritty
    mkdir ~/.config/alacritty/
    cp -i ~/wm/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
    #Wallpaper
    cp -r ~/wm/wallpapers/ ~/.config/
    #Mouse
    sudo cp -i ~/wm/mouse/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf
    #sxhkd
    mkdir ~/.config/sxhkd/
    cp -i ~/wm/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
    #Clean useless file and folder
    sudo rm -r ~/wm/ && rm installer.sh
    case $yn in
        [Yy]* ) reboot;
                break;;
        [Nn]* ) break;;
    esac
}
    
echo "Please choose what you want to do"
options=("New Install (includes basic packages)" "Update")
select option in "${options[@]}"
do
    case $option in
        "New Install (includes basic packages)")
            echo "Beginning config installation...";
            sudo pacman -S git neofetch htop vim man networkmanager brightnessctl otf-aurulent-nerd sxhkd qtile polybar rofi tlp xorg-xrandr arandr nitrogen; 
            config_setup
            #TLP config
            systemctl enable tlp.service
            systemctl start tlp.service
            alacritty -e firefox -private-window https://linrunner.de/tlp/settings/index.html
            alacritty -e sudo vim /etc/tlp.conf
            exit;;
        "Update")
            echo "Beginning config update...";
            config_setup
            exit;;
    esac
done
