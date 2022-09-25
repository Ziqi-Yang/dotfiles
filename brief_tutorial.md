## recommand reading
# https://zhuanlan.zhihu.com/p/273461212
# dual system local time is not consistent: https://sspai.com/post/55983

# from stratch: arch.icekylin.online ( until ...)
sudo pacman -S networkmanager network-manager-applet linux-headers git xdg-user-dirs
sudo systemctl enable NetworkManager # since we are now using iwd, do not start it right now
sudo pacman -S xorg
sudo pacman -S bspwm sxhkd

mkdir ~/.config
cd ~/.config
cp /usr/share/doc/bspwm/examples/bspwmrc bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc sxhkd/
cd ./sxhkd/

sudo pacman -S qterminal firefox rofi # should also install some basic things like fonts and yay(in arch.icekylin.online)
# install fcitx5 and add autostart( fcitx theme fcitx5-nord)
# change the super + Return part command into 'qterminal'
# add super + d part to execute rofi
vim ./sxhkdrc

# install lxdm first, lightdm doesn't display
sudo pacman -S lxdm
sudo systemctl enable lxdm
sudo reboot # then login, remember to change desktop environment to bspwm from 'default'
# sudo pacman -S lightdm lightdm-webkit2-greeter # light-locker ?

# super + return to open a terminal
# note: introduce nmcli basic usage (to connect wifi)
# use xrandr --dpi 196 (change the number) to temporarily change the dpi to make things bigger in a high dpi screen

sudo pacman -S feh # change wallpaper
# to be completed.....

# change gtk theme
cd ./Downloads/
git clone https://github.com/vinceliuice/Layan-gtk-theme.git
cd ./Layan-gtk-theme/
ls
# AUTHORS  COPYING  HACKING.md  install.sh  parse-sass.sh  README.md  src
./install.sh
sudo pacman -S lxappearance # use GUI apps to change the gtk theme (archwiki link: ...)

# change qt theme (for qt apps like qterminal)
sudo pacman -S qt5ct
# add QT_QPA_PLATFORMTHEME environment vairable (val: qt5ct)
# screenshot here
sudo vim /etc/environment
# super + alt + q to exit bspwm
# screenshot here

# since i am use alacritty terminal, qterminal is used for demostration
# change qterminal colorscheme skip (please search on the internet, there are many colorscheme like kali-dark)
# make qterminal nicer skip (like hide tooltip)

# make window transparent & shadow and so on
# pwd: ~
sudo pacman -S picom
mkdir ./.config/picom
cd ./.config/picom/
cp /usr/share/doc/picom/picom.conf.example ./picom.conf
# if you don't have a nvidia gpu you should disable vsync in the config file
# vim ./picom.conf (search vsync and go to the line vsync = true, change it to false)
# add autostart in bspwmrc

# install gpu drivers
# arch.icekylin.online
# for me: intel & nvidia (neofetch screenshot) (haven't open 32 bit program support)
sudo pacman -S mesa vulkan-intel
sudo pacman -S nvidia nvidia-settings
yay -S optimus-manager optimus-manager-qt # can't open optimus-manager-qt ?

# change shell
sudo pacman -S fish
chsh -s /bin/fish

# polybar
sudo pacman -S polybar
mkdir /home/zarkli/.config/polybar
cd /home/zarkli/.config/polybar/
cp /usr/share/doc/polybar/examples/config.ini ./
# add autostart scripts(arch wiki) and autostart in bspwm

# dunst
sudo pacman -S dunst
cp /etc/dunst/dunstrc /home/zarkli/.config/dunst/

# for me
# system config
sudo pacman -S udisks2 udiskie # usb auto mount, run guide: udiskie
yay -S nerd-fonts-fira-code
yay -S google-chrome
sudo pacman -S xclip mpg123 # my fish custom functions required
sudo pacman -S dolphin wget
sudo pacman -S ark p7-zip gzip # ark can decompress 7z file with the support of p7zip(7z command), gzip is required during alacritty installation
echo 'Xft.dpi:192' >> ~/.Xresources # for high dpi screen (see here: HiDPI - archwiki)

# change display manager from lxdm to lightdm
# don't use lightdm-webkit2-greeter, (though beautiful, many error harsh you)
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-slick-greeter
sudo systemctl disable lxdm
sudo systemctl enable lightdm
# use lightdm-slick-greeter:
# change line in the part [Seat:*]: 
# greeter-session=lightdm-slick-greeter
sudo nvim /etc/lightdm/slick-greeter.conf
# file content(just a simple config, please change the background image path):
# [Greeter]
# background=/usr/share/backgrounds/1.jpg
# content end =====
# * when encounter error, try other greeter, or using another display manager

# nodejs and npm & npm user permission
sudo pacman -S nodejs npm
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
# then add ~/.npm-global/bin to path


# brightness control
sudo pacman -S brightnessctl

# sound
sudo pacman -S pulseaudio alsa-utils pulseaudio-alsa
pulseaudio --start # then reboot
# still no sound (probably device is new): 
# https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture#ALSA_firmware
sudo pacman -S sof-firmware alsa-ucm-conf 


# touchpad
# https://blog.csdn.net/qq_41932665/article/details/120855175
sudo pacman -S libinput xf86-input-synaptics
sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d
sudo vim /etc/X11/xorg.conf.d/70-synaptics.conf
# cat /etc/X11/xorg.conf.d/70-synaptics.conf
# Section "InputClass"
# 	Identifier "touchpad"
# 	Driver "synaptics"
# 	MatchIsTouchpad "on"
# 	Option "TapButton1" "1"
# 	Option "TapButton2" "3"
# 	Option "TapButton3" "0"
# 	Option "VertEdgeScroll" "on"
# 	Option "VertTwoFingerScroll" "on"
# 	Option "HorizEdgeScroll" "on"
# 	Option "HorizTwoFingerScroll" "on"
# 	Option "VertScrollDelta" "-112"
# 	Option "HorizScrollDelta" "-114"
# 	Option "MaxTapTime" "125"
# EndSection


