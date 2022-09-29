sudo pacman -S networkmanager network-manager-applet linux-headers git xdg-user-dirs
sudo systemctl enable NetworkManager

sudo pacman -S xorg
sudo pacman -S bspwm sxhkd

mkdir ~/.config
cd ~/.config
cp /usr/share/doc/bspwm/examples/bspwmrc bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc sxhkd/

sudo pacman -S firefox rofi qterminal

sudo pacman -S ntfs-3g
sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra
sudo pacman -S ark dolphin
sudo pacman -S gwenview

sudo pacman -S lxdm
sudo systemctl enable lxdm
sudo systemctl disable dhcpcd

echo
echo
echo ================
echo please edit file ~/.config/sxhkd/sxhkdrc first
echo then reboot
