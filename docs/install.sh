#!/usr/bin/env bash
set -e # exit on error

# git clone https://github.com/Ziqi-Yang/dotfiles.git dotfiles
# cd dotfiles

if grep -q 'archlinuxcn' /etc/pacman.conf; then
  echo 'already added "archlinuxcn" source'
else
  sudo echo '[archlinuxcn]' >> /etc/pacman.conf
  sudo echo 'Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
fi
sudo pacman -S archlinuxcn-keyring

sudo sed -i '1iServer = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sudo sed -i '1iServer = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist

sudo pacman -S paru
mkdir -p ~/.config/paru

sudo pacman -S git xdg-user-dirs ntfs-3g udisks2 udiskie fish ripgrep fd htop neofetch wget brightnessctl

sudo pacman -S pulseaudio alsa-utils pulseaudio-alsa pamixer sof-firmware alsa-ucm-conf

sudo pacman -S bluez bluez-utils pulseaudio-bluetooth pulseaudio-alsa blueman
sudo systemctl enable bluetooth
sudo usermod -a -G lp $USER

sudo pacman -S libinput xf86-input-synaptics

sudo pacman -S lightdm lightdm-slick-greeter lxdm
sudo systemctl disable lxdm
sudo systemctl enable lightdm

sudo pacman -S mesa vulkan-intel nvidia nvidia-settings

paru -S hyprland-git
sudo pacman -S xorg-xwayland xorg-xlsclients qt5-wayland glfw-wayland qt6-wayland
sudo pacman -S dunst wireplumber pipewire polkit-kde-agent

sudo pacman -S wev-git wl-clipboard wtype clipman gammastep

mkdir -p ~/.local/share/fonts
cp assets/fonts/* ~/.local/share/fonts/
fc-cache -rv

sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra  ttf-lxgw-wenkai ttf-lxgw-wenkai-mono

paru -S ttf-firacode-nerd

sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-anthy fcitx5-pinyin-moegirl fcitx5-material-color

paru -S mpg123

sudo pacman -S grim slurp swappy flameshot

sudo pacman -S ranger dolphin

sudo pacman -S ark unarchiver p7zip gzip unzip zip

sudo pacman -S alacritty kitty

sudo pacman -S firefox

sudo pacman -S lxappearance qt5ct

sudo pacman -S vi vim

sudo pacman -S make cmake

sudo pacman -S lldb gdb cgdb valgrind

sudo pacman -S ipython python-pip

sudo pacman -S rustup rust-analyzer

paru -S clang ccls

paru -S go

sudo pacman -S shellcheck bash-language-server

sudo pacman -S texlab biber

sudo pacman -S nodejs npm

sudo pacman -S sqlite pandoc libvterm

sudo pacman -S highlight poppler mediainfo w3m catdoc docx2txt jq python-pdftotext ffmpegthumbnailer fontforge trash-cli unarchiver zoxide dragon-drop

mkdir -p /etc/polkit-1/rules.d
echo '// See the polkit(8) man page for more information
// about configuring polkit.

// Allow udisks2 to mount devices without authentication
// for users in the "wheel" group.
polkit.addRule(function(action, subject) {
    if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
         action.id == "org.freedesktop.udisks2.filesystem-mount") &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});' > /etc/polkit-1/rules.d/10-udisks2.rules

sudo sed -i 's/#greeter-session=.*/greeter-session=hello/g' /etc/lightdm/lightdm.conf

echo '#!/bin/sh

cd ~ || exit

export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24

# qt
QT_AUTO_SCREEN_SCALE_FACTOR=1
QT_QPA_PLATFORM="wayland;xcb"
QT_WAYLAND_DISABLE_WINDOWDECORATION=1
QT_QPA_PLATFORMTHEME=qt5ct

XCURSOR_THEME=GoogleDot-Blue
XCURSOR_SIZE=24

exec Hyprland' > /usr/share/wayland-sessions/hyprland_wrap
chmod +x /usr/share/wayland-sessions/hyprland_wrap

echo '[Desktop Entry]
Name=Hyprland_Wrap
Comment=An intelligent dynamic tiling Wayland compositor
Exec=/usr/share/wayland-sessions/hyprland_wrap
Type=Application' >  /usr/share/wayland-sessions/hyprland_wrap.desktop

sudo sed -i 's/#user-session=.*/user-session=hyprland_wrap/g' /etc/lightdm/lightdm.conf

echo '[Greeter]
background=/usr/share/background/4.png
enable-hidpi=auto' > /etc/lightdm/slick-greeter.conf

sudo systemctl disable dhcpcd

echo 'export TERMINAL="alacritty"' >> ~/.profile

sudo pacman -S tela-icon-theme-git

sudo pacman -S kvantum
