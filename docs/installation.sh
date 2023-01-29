#!/usr/bin/env bash

if grep -q 'archlinuxcn' /etc/pacman.conf; then
  echo 'already added "archlinuxcn" source'
else
  sudo echo '[archlinuxcn]' >> /etc/pacman.conf
  sudo echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
fi
sudo pacman -S archlinuxcn-keyring

sudo pacman -S paru

sudo pacman -S git xdg-user-dirs ntfs-3g udisks2 udiskie fish ripgrep htop neofetch wget
chsh -s /bin/fish # change default shell for current user

sudo pacman -S lightdm lightdm-slick-greeter lxdm
sudo systemctl disable lxdm
sudo systemctl enable lightdm

paru -S hyprland-git xorg-xwayland xorg-xlsclients qt5-wayland glfw-wayland qt6-wayland
paru -S dunst wireplumber pipewire polkit-kde-agent xdg-desktop-portal-hyprland-git
paru -S wev wl-clipboard wtype
paru -S clipman hyprpaper rofi-lbonn-wayland-git waybar-hyprland-git gammastep

sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra

paru -S hyprpick

paru -S fcitx5-im fcitx5-chinese-addons fcitx5-anthy fcitx5-pinyin-moegirl fcitx5-material-color fcitx5-pinyin-custom-pinyin-dictionary

paru -S gwenview imv

paru -S grim slurp swappy flameshot

paru -S ranger dolphin

paru -S ark unarchiver p7zip gzip unzip

paru -S firefox

paru -S emacs29-git

sudo systemctl disable dhcpcd
