while true; do
    read -p "New install? (y/n) " yn
    case $yn in
        [Yy]* ) sudo pacman -S git neofetch htop vim networkmanager brightnessctl otf-aurulent-nerd firefox qtile polybar rofi tlp xorg-xrandr arandr; 
                git clone https://github.com/maxlttr/wm.git;
                
                #Polybar
                mkdir ~/.config/polybar/;
                cp -i ~/wm/polybar/config.ini ~/.config/polybar/config.ini;
               
                #Qtile
                cp -i ~/wm/qtile/config.py ~/.config/qtile/config.py;
                chmod +x ~/wm/qtile/autostart.sh;
                cp -i ~/wm/qtile/autostart.sh ~/.config/qtile/autostart.sh;
               
                #Wallpaper
                cp -r ~/wm/wallpapers/ ~/.config/qtile/;
                
                #Mouse
                sudo cp -i ~/wm/mouse/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf;
                
                #Configure TLP
		alacritty -e firefox -new-window https://linrunner.de/tlp/settings/introduction.html;
                alacritty -e sudo vim /etc/tlp.conf;
	
                #Clean useless file and folder
                sudo rm -r ~/wm/ && rm installer.sh; 

		read -p "Reboot now? (y/n) " yn
                case $yn in
                	[Yy]* ) reboot; break;;
                	[Nn]* ) exit;;
		esac
		break;;

	[Nn]* ) read -p "Do you wish to update? (y/n) ";
		case $yn in
			[Yy]* ) git clone https://github.com/maxlttr/wm.git;
                        
                                #Polybar
                                mkdir ~/polybar/.config/polybar/;
                                cp -i ~/wm/polybar/config.ini ~/.config/polybar/config.ini;
                              
                                #Qtile
                                cp -i ~/wm/qtile/config.py ~/.config/qtile/config.py;
                                chmod +x ~/wm/qtile/autostart.sh;
                                cp -i ~/wm/qtile/autostart.sh ~/.config/qtile/autostart.sh;
                               
                                #Wallpaper
                                cp -r ~/wm/wallpapers/ ~/.config/qtile/wallpapers/;
                               
                                #Mouse
                                sudo cp -i ~/wm/mouse/30-touchpad.conf /etc/X11/xorg.conf.d/30-touchpad.conf;
                               
                                #Clean useless file and folder
                                sudo rm -r ~/wm/ && rm installer.sh;

				read -p "Reboot now? (y/n) " yn;
                                case $yn in
                                        [Yy]* ) reboot; break;;
                                        [Nn]* ) exit;;
				esac
			       	break;;

			[Nn]* ) exit;;
		esac
    esac
done

