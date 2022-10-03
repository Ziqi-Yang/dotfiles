# 废话不多说的安装教程  
注意，本教程还未经过测试   
如果不能理解含义请去[从零开始的Bspwm安装与配置教程](./detailed_installation_guide.md)  

## 预备
(Arch Linux 基础安装部分)

参照[archlinux简明指南](https://arch.icekylin.online/) （这个教程是基于[Arch Linux 安装使用教程](https://archlinuxstudio.github.io/ArchLinuxTutorial/#/)的，
如果哪天网站挂了可以直接去看这个地址, 或者到[其github repo里](https://github.com/NakanoMikuOrg/arch-guide)）, 请完成[archlinux 基础安装
](https://arch.icekylin.online/rookie/basic-install.html)的全部部分以及[桌面环境与常用应用安装](https://arch.icekylin.online/rookie/desktop-env-and-app.html)的非桌面环境部分, 此处列出: 
  - 确保系统为最新
  - 配置 root 账户的默认编辑器
  - 准备非 root 用户
  - 开启 32 位支持库与 Arch Linux 中文社区仓库（archlinuxcn)
    > 个人没开启32位支持库
  - 安装基础功能包(网络设置部分中关闭iwd部分)
    > 注意此处的`sudo systemctl enable --now NetworkManager` 不要执行
  - 配置非 root 账户的默认编辑器

## 安装

### 图形化之前
可以把这段粘贴到pastebin.com中, curl下载下来执行  
```bash
sudo pacman -S networkmanager network-manager-applet linux-headers git xdg-user-dirs xorg bspwm sxhkd firefox rofi qterminal ntfs-3g adobe-source-han-serif-cn-fonts wqy-zenhei noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra gwenview lxdm

sudo systemctl enable lxdm
sudo systemctl disable dhcpcd
sudo systemctl enable NetworkManager 

mkdir ~/.config
cd ~/.config
mkdir ./bspwm ./sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc sxhkd/
```
改变文件 `~/.config/sxhkd/sxhkdrc` 中的对应部分:  
```
super + Return
	qterminal

super + space
	rofi -show drun
```
然后**重启**(`sudo reboot`)

### 图形化之后

首先联网

```bash
sudo nmcli device wifi list
sudo nmcli device wifi connect xxxxx password xxxxx
```
然后可以打开浏览器(firefox)到本仓库，copy & paste  

#### 本repo配置文件安装
```bash
git clone https://github.com/Ziqi-Yang/dotfiles.git ~/Downloads/dotfiles

# .config文件夹下
cd ~/Downloads/dotfiles/.config
# 下面命令用来删除原来就存在~/.config目录中的配置文件夹
find * -maxdepth 1 -type d | xargs -i rm -rf "$HOME/.config/{}"
cd -rf ./* ~/.config/
cd ../

cp ./myBin ~/

# assets文件夹下
mkdir -p ~/.local/share/fonts
mkdir -p ~/.local/share/icons
mkdir ~/Picture/background
sudo mkdir /user/share/background

cp ./assets/fonts/* ~/.local/share/fonts/
cp ./assets/images/background/* ~/Picture/background/
cp ./assets/images/background/* /usr/share/background/

cd ./assets/icons
tar -xf ./deepin2022.tar.xz
mv ./Deepin2022 ~/.local/share/icons
mv ./Deepin2022-Dark ~/.local/share/icons
cd ../../

fc-cache -rv

# .local文件夹下
mkdir -p ~/.local/share/rofi/themes/
cp ./.local/share/rofi/themes/* ~/.local/share/rofi/themes/
```

#### 一大推东西
注意一段一段复制，这样出错了也方便调试  

```bash
sudo pacman -S archlinuxcn-keyring
pacman -Syyu

sudo pacman -S yay feh neovim fcitx5-im fcitx5-chinese-addons fcitx5-anthy fcitx5-pinyin-moegirl fcitx5-material-color polybar dunst fish udisks2 udiskie ripgrep htop neofetch xclip mpg123 wget ark p7zip gzip nodejs npm lxappearance qt5ct redshift downgrade
yay -S nerd-fonts-fira-code
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-slick-greeter betterlockscreen xautolock
sudo pacman -S brightnessctl pulseaudio alsa-utils pulseaudio-alsa sof-firmware alsa-ucm-conf bluez bluez-utils pulseaudio-bluetooth blueman
sudo pacman -S libinput xf86-input-synaptics
```

```bash
pulseaudio --start
sudo systemctl enable bluetooth
sudo usermod -a -G lp $USER
echo 'QT_QPA_PLATFORMTHEME=qt5ct' > /etc/environment
betterlockscreen -u ~/Pictures/background/
```

```bash
sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d
sudo tee /etc/X11/xorg.conf.d/70-synaptics.conf<<EOF
Section "InputClass"
	Identifier "touchpad"
	Driver "synaptics"
	MatchIsTouchpad "on"
	Option "TapButton1" "1"
	Option "TapButton2" "3"
	Option "TapButton3" "0"
	Option "VertEdgeScroll" "on"
	Option "VertTwoFingerScroll" "on"
	Option "HorizEdgeScroll" "on"
	Option "HorizTwoFingerScroll" "on"
	Option "VertScrollDelta" "-112"
	Option "HorizScrollDelta" "-114"
	Option "MaxTapTime" "125"
EndSection
EOF
```

```bash
sudo sed -i "s/^#HandlePowerKey=.*\$/HandlePowerKey=ignore/" /etc/systemd/logind.conf
sudo sed -i "s/^#HandlePowerKeyLongPress=.*\$/HandlePowerKeyLongPress=poweroff/" /etc/systemd/logind.conf
sudo sed -i "s/^#HandleLidSwitch=.*\$/HandleLidSwitch=ignore/" /etc/systemd/logind.conf
sudo sed -i "s/^#HandleLidSwitchExternalPower=.*\$/HandleLidSwitchExternalPower=ignore/" /etc/systemd/logind.conf
sudo systemctl restart systemd-logind.service
```

```bash
cd ~/Downloads/
git clone https://github.com/vinceliuice/Layan-gtk-theme.git
cd ./Layan-gtk-theme/
./install.sh

cd ~/Downloads/
git clone https://github.com/tonyfettes/fcitx5-nord.git
mkdir -p ~/.local/share/fcitx5/themes/
cd fcitx5-nord
cp -r Nord-Dark/ Nord-Light/ ~/.local/share/fcitx5/themes/
echo "Theme=Nord-Dark" > ~/.config/fcitx5/conf/classicui.conf

cd ~/Download
git clone https://github.com/13atm01/GRUB-Theme.git
cd ./GRUB-Theme/Hoshimati\ Suisei/
chmod +x ./install.sh
./install.sh

chsh -s /bin/fish
```


lightdm设置
```bash
sudo sed -i "s/^#greeter-session=.*\$/greeter-session=lightdm-slick-greeter/" /etc/lightdm/lightdm.conf
sudo sed -i "s/^#user-session=.*\$/user-session=bspwm/" /etc/lightdm/lightdm.conf

echo '[Greeter]' | sudo tee /etc/lightdm/slick-greeter.conf
# 这里不用担心，前面已经复制好图片了
echo 'background=/usr/share/background/1.jpg' | sudo tee -a /etc/lightdm/slick-greeter.conf

sudo systemctl disable lxdm
sudo systemctl enable lightdm
```

**下面命令看个人情况**
```bash
echo 'Xft.dpi:192' >> ~/.Xresources # 分辨率
sudo pacman -S mesa vulkan-intel # 只安装intel核显驱动, 不装navida
```
**先编辑bspwmrc文件，注释多余启动项**   
**重启**  
  
#### alacritty
这里使用的是自己编译  
注意分开粘贴,若出错请看官方页面(详细)
```bash
cd ~/Download
git clone https://github.com/alacritty/alacritty.git
cd alacritty

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # install rust

# 可以要重开shell或终端
rustup override set stable
rustup update stable

pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python

cargo build --release

infocmp alacritty # 有输出就行

# desktop entry
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# manual page
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null


# shell completions 
# zsh # 进入zsh !!!!!!!!!
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc
exit

mkdir -p ~/.bash_completion
cp extra/completions/alacritty.bash ~/.bash_completion/alacritty
echo "source ~/.bash_completion/alacritty" >> ~/.bashrc

mkdir -p $fish_complete_path[1]
cp extra/completions/alacritty.fish $fish_complete_path[1]/alacritty.fish

# 更改默认终端
echo 'export TERMINAL="alacritty"' >> ~/.profile
```

#### ranger

```bash
sudo pacman -S ranger highlight atool w3m poppler mediainfo catdoc docx2txt ueberzug trash-cli
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
git clone https://github.com/SL-RU/ranger_udisk_menu ~/.config/ranger/plugins/ranger_udisk_menu

vim /etc/polkit-1/rules.d/10-udisks2.rules
# 删掉前面的#号
# // See the polkit(8) man page for more information
# // about configuring polkit.
# 
# // Allow udisks2 to mount devices without authentication
# // for users in the "wheel" group.
# polkit.addRule(function(action, subject) {
#     if ((action.id == "org.freedesktop.udisks2.filesystem-mount-system" ||
#          action.id == "org.freedesktop.udisks2.filesystem-mount") &&
#         subject.isInGroup("wheel")) {
#         return polkit.Result.YES;
#     }
# });
```


#### 配置

```bash
# fcitx5
echo INPUT_METHOD DEFAULT=fcitx5 >> ~/.pam_environment
echo GTK_IM_MODULE DEFAULT=fcitx5 >> ~/.pam_environment
echo QT_IM_MODULE DEFAULT=fcitx5 >> ~/.pam_environment
echo XMODIFIERS DEFAULT=\@im=fcitx5 >> ~/.pam_environment
echo SDL_IM_MODULE DEFAULT=fcitx >> ~/.pam_environment

# npm
mkdir ~/.npm-global 
npm config set prefix '~/.npm-global'

# ideavimrc
curl "https://raw.githubusercontent.com/Ziqi-Yang/ide_vim_configs/main/ideavimrc" -o ~/.ideavimrc
```

```bash
sudo EDITOR=vim visudo
# 添加行
# <your_username> ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown
```


#### 其余
```bash
sudo pacman -S python python-pip go jdk-openjdk megasync kdeconnect flameshot

pip install pynvim

go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
mkdir -p ~/go/src
echo 'export PATH="$PATH:$HOME/go/bin"' > ~/.bashrc

sudo pacman -S git
# 下面都改成你自己的
git config --global user.name "Zarkli Leonardo"
git config --global user.email "mr.ziqiyang@gmail.com"
ssh-keygen -t ed25519 -C "mr.ziqiyang@gmail.com"
git config --global core.editor "nvim"
git config --global https.proxy http://127.0.0.1:7890
git config --global https.proxy https://127.0.0.1:7890
```


#### 其他安装
也包括可能需要翻墙的安装

```bash
yay -S google-chrome

npm install -g neovim

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
mkdir ~/.config/nvim/lua/user/
curl "https://raw.githubusercontent.com/Ziqi-Yang/astronvim_config/main/init.lua" -o ~/.config/nvim/lua/user/init.lua
nvim +PackerSync
```
**关于emacs**见[我的doom emacs配置](https://github.com/Ziqi-Yang/.doom.d)   

#### tips

通过`lxappearance` 和 `qt5ct` 设置外观。  
desktop 文件格式:
```ini
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/path/to/executable
Name=Name of Application
Icon=/path/to/icon
```
