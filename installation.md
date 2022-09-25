# 从零开始的安装教程

OS: Arch Linux  
Windows Manager: Bspwm

## 预备

1. Recommand Reading:
  - [BSPWM vs dwm , i3 , awesome](https://zhuanlan.zhihu.com/p/273461212)
  - 

2. 参照[archlinux简明指南](https://arch.icekylin.online/) （这个教程是基于[Arch Linux 安装使用教程](https://archlinuxstudio.github.io/ArchLinuxTutorial/#/)的，
如果哪天网站挂了可以直接去看这个地址, 或者到[其github repo里](https://github.com/NakanoMikuOrg/arch-guide)）, 请完成[archlinux 基础安装
](https://arch.icekylin.online/rookie/basic-install.html)的全部部分以及[桌面环境与常用应用安装](https://arch.icekylin.online/rookie/desktop-env-and-app.html)的非桌面环境部分(请自己判断哪些需要, 后文可能会有部分重复)


## 正式安装

### 基础安装

```shell
sudo pacman -S networkmanager network-manager-applet linux-headers git xdg-user-dirs
sudo systemctl enable NetworkManager

sudo pacman -S xorg
sudo pacman -S bspwm sxhkd

mkdir ~/.config
cd ~/.config
cp /usr/share/doc/bspwm/examples/bspwmrc bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc sxhkd/

sudo pacman -S firefox
sudo pacman -S rofi qterminal # rofi 应用程序启动器, 先安装qterminal作为后续bapwm环境的临时主要终端
```

然后修改`~/.config/sxhkd/sxhkdrc`文件里的部分内容(寻找对应内容进行更改)为:
```plain-text
super + Return
	qterminal

super + space
	rofi -show drun
```
然后安装几个基本的包, 之后重启系统就可以按 super(win) + return(enter) 打开terminal, super + space 打开rofi程序启动器

```shell
sudo pacman -S ntfs-3g # 使系统可以识别 NTFS 格式的硬盘
sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei # 安装几个开源中文字体。一般装上文泉驿就能解决大多 wine 应用中文方块的问题
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra # 安装谷歌开源字体及表情
sudo pacman -S ark dolphin # 压缩软件。在 dolphin 中可用右键解压压缩包
sudo pacman -S gwenview # 图片查看器

```

#### 安装display manager

用于进入不同的Xsession(可以理解为桌面环境或者wm)  

```shell
sudo pacman -S lxdm # 测试发现lightdm貌似没用，lxdm可以使用? 先安装lxdm, 对后续系统故障也有好处
sudo systemctl enable lxdm
sudo reboot
```
记得在lxdm的界面将session从default改为bspwm(可选列表内容也就是`/usr/share/xsessions`里的session名称, 而`default`并没有在目录里也会显示)  
重启机器了后之后可以打开浏览到本页面复制粘贴命令运行  
使用`xrandr --dpi 192` 来临时设置分辨率(不过这种方法像firefox等一些应用不会改变行为), 之后会有提及永久设置的方法  
连接wifi：[NetworkManager cli版使用教程](https://huataihuang.gitbooks.io/cloud-atlas/content/os/linux/redhat/system_administration/network/networkmanager_nmcli.html)  
这里也简单列下命令  

```shell
sudo nmcli device wifi list # 列出(先scan)可选wifi
sudo nmcli device wifi connect bjut_wifi # 连接没密码的
sudo nmcli device wifi connect Leonardo password 12345678  # 连接有密码的
```

### 设置壁纸

```shell
sudo pacman -S feh
# 如 feh --bg-center $HOME/Pictures/background/1.jpg
# 在bspwm中添加命令来开机自启
```

### 安装基础软件(1)

```shell
# 记得根据预备中说的文档配置archlinuxcn源
sudo pacman -S archlinuxcn-keyring # cn 源中的签名（archlinuxcn-keyring 在 archlinuxcn）
sudo pacman -S yay # yay 命令可以让用户安装 AUR 中的软件（yay 在 archlinuxcn）



# 安装输入法, 之后会设置开机自启
sudo pacman -S fcitx5-im # 输入法基础包组
sudo pacman -S fcitx5-chinese-addons # 官方中文输入引擎
sudo pacman -S fcitx5-anthy # 日文输入引擎
sudo pacman -S fcitx5-pinyin-moegirl # 萌娘百科词库。二刺猿必备（archlinuxcn）
sudo pacman -S fcitx5-material-color # 输入法主题
vim ~/.pam_environment
# INPUT_METHOD DEFAULT=fcitx5
# GTK_IM_MODULE DEFAULT=fcitx5
# QT_IM_MODULE DEFAULT=fcitx5
# XMODIFIERS DEFAULT=\@im=fcitx5
# SDL_IM_MODULE DEFAULT=fcitx
echo 'fcitx5 &' >> ~/.config/bspwm/bspwmrc # 添加开机自启
```

(仅对我个人)安装[alacritty](https://github.com/alacritty/alacritty)

### 安装窗口合成器

窗口合成器可以使窗口透明，阴影以及添加动效  
这里安装picom   

```shell
sudo pacman -S picom
mkdir ~/.config/picom
cd ~/.config/picom/
cp /usr/share/doc/picom/picom.conf.example ./picom.conf # 使用默认配置
# 如果没有nvidia gpu, 你应该关闭配置文件中的`vsync`选项
# vim ./picom.conf (转到行vsync = true, 改变其值为false)
echo 'picom &' > ~/.config/bspwm/bspwmrc # 开机自启
```

### 安装polybar

```shell
sudo pacman -S polybar
mkdir /home/zarkli/.config/polybar
cd /home/zarkli/.config/polybar/
cp /usr/share/doc/polybar/examples/config.ini ./
```
(为polybar)添加启动脚本(参考[Polybar - Arch Wiki](https://wiki.archlinux.org/title/Polybar#Running_with_a_window_manager))  
编辑(创建)`$HOME/.config/polybar/launch.sh`文件: 

```shell
#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
# 使用polybar中自定义的example (bar/example)
polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
```
然后在bspwm配置文件中填加启动命令`$HOME/.config/polybar/launch.sh`  


### 安装通知管理器

```shell
sudo pacman -S dunst
cp /etc/dunst/dunstrc /home/zarkli/.config/dunst/
echo 'dunst &' > ~/.config/bspwm/bspwmrc # 开机自启
```


### 改变


## 安装后续工作

### 安装gpu驱动
见[archlinux 显卡驱动](https://arch.icekylin.online/rookie/graphic-driver.html)  

```shell
# for me: intel & nvidia (neofetch screenshot) (haven't open 32 bit program support)
sudo pacman -S mesa vulkan-intel
sudo pacman -S nvidia nvidia-settings
yay -S optimus-manager optimus-manager-qt # can't open optimus-manager-qt ?
```

### 安装fish shell (可选)

```shell
sudo pacman -S fish
chsh -s /bin/fish
```

### 使用lightdm作为display manager

```shell
# don't use lightdm-webkit2-greeter, (though beautiful, many error may harsh your life)
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-slick-greeter
sudo systemctl disable lxdm
sudo systemctl enable lightdm
# 使用 lightdm-slick-greeter 作为lightdm 的greeter:
# change line in the part [Seat:*]: 
# greeter-session=lightdm-slick-greeter

# sudo nvim /etc/lightdm/slick-greeter.conf # 默认不存在这个文件，直接创建
# file content(just a simple config, please change the background image path):
# [Greeter]
# background=/usr/share/backgrounds/1.jpg
# content end =====
# * when encounter error, try other greeters, or use another display manager
```


### 系统修复

#### 高分辨率屏幕设置
见[HiDPI - Arch Wiki](https://wiki.archlinux.org/title/HiDPI#Enlightenment) , [Xorg - Arch Wiki](https://wiki.archlinux.org/title/xorg#Setting_DPI_manually) 也有相关部分。
```shell
# 192是96(默认)的两倍，也就是放大2倍
echo 'Xft.dpi:192' >> ~/.Xresources 
```

4. dual system local time is not consistent: https://sspai.com/post/55983

### 系统美化

#### 改变gtk主题

1. 安装主题`Layan-gtk-theme`

```shell
cd ./Downloads/
git clone https://github.com/vinceliuice/Layan-gtk-theme.git
cd ./Layan-gtk-theme/
# ls
# AUTHORS  COPYING  HACKING.md  install.sh  parse-sass.sh  README.md  src
./install.sh
```
2. 安装GUI般gkt主题设置工具lxappearance
```shell
sudo pacman -S lxappearance # use GUI apps to change the gtk theme (archwiki link: ...)
```

#### 改变qt主题

像 `dolphin`, `qterminal` 这些应用就是使用qt的  

```shell
sudo pacman -S qt5ct
# add QT_QPA_PLATFORMTHEME environment vairable (val: qt5ct)
# sudo vim /etc/environment
# QT_QPA_PLATFORMTHEME=qt5ct
# 编辑完后使用 super + alt + q 来退出 bspwm
```


#### fcitx 主题




## ranger
go to [readme](./.config/ranger/README.md)

## rofi

please install [rofi themes collections](https://github.com/lr-tech/rofi-themes-collection) first
(should some changes in the theme css to make the display box bigger)

## Other

### Fonts

[nerd font](https://github.com/ryanoasis/nerd-fonts) choosing fira code patched(
can be direcrctly installed from aur)  

### Icons

[Deepin Icons 2022](https://store.kde.org/p/1678986/)
decompress it and copy them (light and dark themes) into the `~/.local/share/icons/` folder

### GRUB themes

[GRUB-Theme](https://github.com/13atm01/GRUB-Theme)

### lightdm-theme
[lightdm-webkit2-theme-glorious](https://github.com/manilarome/lightdm-webkit2-theme-glorious)

### usb automatic mount

[tutorial here](https://wiki.archlinux.org/title/ranger#External_drives)
(install udisks then install [udiskie](https://github.com/coldfix/udiskie))

