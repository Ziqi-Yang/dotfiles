#!/usr/bin/env bash
set -e # exit on error

# git clone --recurse-submodules --depth 1 --branch main https://github.com/Ziqi-Yang/dotfiles.git dotfiles
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

sudo pacman -S git xdg-user-dirs ntfs-3g udisks2 udiskie fish ripgrep fd htop neofetch wget brightnessctl ncdu duf hwinfo rsync

sudo pacman -S pulseaudio alsa-utils pulseaudio-alsa pamixer sof-firmware alsa-ucm-conf

sudo pacman -S bluez bluez-utils pulseaudio-bluetooth pulseaudio-alsa blueman
sudo systemctl enable bluetooth
sudo usermod -a -G lp $USER

sudo pacman -S os-prober
sudo sed '1aGRUB_DISABLE_OS_PROBER=false' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

sudo pacman -S lightdm lightdm-slick-greeter lxdm
sudo systemctl disable lxdm
sudo systemctl enable lightdm

sudo pacman -S libinput xf86-input-synaptics

sudo pacman -S mesa vulkan-intel nvidia nvidia-settings

paru -S hyprland-git
sudo pacman -S xorg-xwayland xorg-xlsclients qt5-wayland glfw-wayland qt6-wayland
sudo pacman -S dunst wireplumber pipewire polkit-kde-agent

sudo pacman -S wev-git wl-clipboard wtype clipman gammastep wofi

sudo pacman -S virt-manager qemu vde2 iptables-nft dnsmasq bridge-utils openbsd-netcat edk2-ovmf swtpm
sudo systemctl enable libvirtd.service
sudo usermod -a -G libvirt $USER

mkdir -p ~/.local/share/fonts
cp assets/fonts/* ~/.local/share/fonts/
fc-cache -rv

sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra  ttf-lxgw-wenkai ttf-lxgw-wenkai-mono wqy-zenhei

sudo pacman -S ttf-firacode-nerd ttf-ibm-plex

sudo pacman -S ttf-font-awesome

sudo mkdir -p /usr/share/background/
sudo cp assets/images/background/* /usr/share/background/

sudo pacman -S fzf trash-cli zoxide scrcpy gtk3-demos yt-dlp lux-dl rofimoji rofi-calc bat curl fd ffmpeg gnupg hugo

sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-anthy fcitx5-pinyin-moegirl fcitx5-material-color

sudo pacman -S gimp inkscape gwenview imv

sudo pacman -S mpv obs-studio blender

sudo pacman -S zathura zathura-cb zathura-djvu zathura-pdf-mupdf

sudo pacman -S mpg123

sudo pacman -S grim slurp swappy flameshot

sudo pacman -S ranger dolphin

paru -S wps-office wps-office-mui-zh-cn ttf-wps-fonts

sudo pacman -S ark unarchiver p7zip gzip unzip zip

sudo pacman -S alacritty kitty

sudo pacman -S firefox

sudo pacman -S telegram-desktop

sudo pacman -S lxappearance qt5ct

sudo pacman -S vi vim helix

sudo pacman -S bfg git-delta

sudo pacman -S make cmake

sudo pacman -S lldb gdb cgdb valgrind

sudo pacman -S ipython python-pip

sudo pacman -S rustup rust-analyzer

sudo pacman -S clang ccls man-pages

sudo pacman -S jdk8-openjdk jdk-openjdk maven

paru -S go

sudo pacman -S shellcheck bash-language-server

sudo pacman -S texlive-most texlive-lang texlab biber

sudo pacman -S android-sdk android-sdk-platform-tools android-sdk-build-tools
sudo pacman -S android-platform

sudo groupadd android-sdk
sudo gpasswd -a $USER android-sdk
sudo setfacl -R -m g:android-sdk:rwx /opt/android-sdk
sudo setfacl -d -m g:android-sdk:rwX /opt/android-sdk

sudo pacman -S nodejs npm deno pnpm

sudo pacman -S sqlite pandoc libvterm tokei hexyl jq

echo 'QT_QPA_PLATFORMTHEME=qt5ct' >> >> /etc/environment

echo 'GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx' >> /etc/environment

sudo pacman -S alacritty kitty mpg123 htop duf trash-cli dolphin playerctl pacman-contrib libpulse

sudo sed -i "s/#HandleLidSwitch=suspend/HandleLidSwitch=ignore/g" /etc/systemd/logind.conf
sudo sed -i "s/#HandleLidSwitchExternalPower=suspend/HandleLidSwitchExternalPower=ignore" /etc/systemd/logind.conf
sudo sed -i "s/#HandleLidSwitchExternalPower=suspend/HandleLidSwitchExternalPower=ignore/g" /etc/systemd/logind.conf

sudo sed -i 's/#MAKEFLAGS=.*/MAKEFLAGS="-j$(nproc)"/g' /etc/makepkg.conf

sudo sed -i 's/# deny =.*/deny = 5/g' /etc/security/faillock.conf

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

# sudo sed -i 's/#session-wrapper=.*/session-wrapper=\/etc\/lightdm\/Xsession/g' /etc/lightdm/lightdm.conf

echo '[Greeter]
background=/usr/share/background/4.png
enable-hidpi=auto' > /etc/lightdm/slick-greeter.conf

sudo systemctl disable dhcpcd

echo 'export TERMINAL="alacritty"' >> ~/.profile

sudo pacman -S tela-icon-theme-git

sudo pacman -S kvantum

paru -S firefox-user-autoconfig

# the pakcage needs some tweaks
echo 'pref("general.config.sandbox_enabled", false);' >> /usr/lib/firefox/defaults/pref/autoconfig.js
