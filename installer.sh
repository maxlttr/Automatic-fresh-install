read -p "Install basic packages? (y/n) " yn
case $yn in
    [Yy]* ) sudo pacman -S git neofetch htop vim networkmanager brightnessctl otf-aurulent-nerd firefox qtile polybar rofi tlp xorg-xrandr arandr nitrogen; 
            git clone https://github.com/maxlttr/wm.git;
            break;;
    [Nn]* ) break;;
esac
echo "Beginning config installation..."
git clone https://github.com/maxlttr/wm.git;
#Qtile
resolution=("1920x1080" "1366x768")
select fav in "${resolution[@]}" 
do
    case $fav in
        "1920x1080") 
            cp -i ~/wm/qtile/1920x1080/config.py ~/.config/qtile/config.py;
            break;;
        "1366x768") 
            cp -i ~/wm/qtile/1366x768/config.py ~/.config/qtile/config.py;
            break;;
    esac
done

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
mkdir ~/.config/sxhkd/
cp -i ~/wm/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc		
                
#Clean useless file and folder
sudo rm -r ~/wm/ && rm installer.sh; 

echo "Don't forget to configure TLP before rebooting..."
