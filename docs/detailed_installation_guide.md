# 从零开始的Bspwm安装与配置教程
**下面命令看个人情况**

OS: `Arch Linux`  
Windows Manager: `Bspwm`  

我的[dotfiles](https://github.com/Ziqi-Yang/dotfiles)

本教程还包括安装系统后续问题的修复  
youtube上有个非常好的视频教程[bspwm: How To "Rice" Your Desktop](https://www.youtube.com/watch?v=HxbhkkfaVuo), 但不是从头开始的  

## 预备

1. Recommand Reading:
  - [BSPWM vs dwm , i3 , awesome](https://zhuanlan.zhihu.com/p/273461212)

2. 参照[archlinux简明指南](https://arch.icekylin.online/) （这个教程是基于[Arch Linux 安装使用教程](https://archlinuxstudio.github.io/ArchLinuxTutorial/#/)的，
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



## 正式安装

### 基础安装

```bash
sudo pacman -S networkmanager network-manager-applet linux-headers git xdg-user-dirs
sudo systemctl enable NetworkManager
# 注意networkmanager启动(下次开机前), 需要关闭dhcpcd服务(之后会提及), 请参考 * 网络连接问题 一章节

sudo pacman -S xorg
sudo pacman -S bspwm sxhkd

mkdir ~/.config
cd ~/.config
mkdir ./bspwm ./sxhkd
cp /usr/share/doc/bspwm/examples/bspwmrc bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc sxhkd/

sudo pacman -S firefox
sudo pacman -S rofi qterminal # rofi 应用程序启动器, 先安装qterminal作为后续bapwm环境的临时主要终端
```

然后修改`~/.config/sxhkd/sxhkdrc`文件里的部分内容(寻找对应内容进行更改)为:

```
super + Return
	qterminal

super + space
	rofi -show drun
```
然后安装几个基本的包, 之后重启系统(请按教程提示说重启再重启)后就可以按 super(win) + return(enter) 打开terminal, super + space 打开rofi程序启动器

```bash
sudo pacman -S ntfs-3g # 使系统可以识别 NTFS 格式的硬盘
sudo pacman -S adobe-source-han-serif-cn-fonts wqy-zenhei # 安装几个开源中文字体。一般装上文泉驿就能解决大多 wine 应用中文方块的问题
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra # 安装谷歌开源字体及表情
sudo pacman -S ark dolphin # 压缩软件。在 dolphin 中可用右键解压压缩包
sudo pacman -S gwenview # 图片查看器

```

#### 安装display manager

用于进入不同的Xsession(可以理解为桌面环境或者wm)  

```bash
sudo pacman -S lxdm # 测试发现lightdm貌似没用，lxdm可以使用? 
sudo systemctl enable lxdm
sudo systemctl disable dhcpcd # 使用networkmanagr时不能启用dhcpcd的systemd服务
sudo reboot
```
之所以要关闭`dhcpcd`的systemd服务，请参考**网络连接问题**一章节，也可以到archwiki的NetworkManager中的dhcp client小节中查看  
记得在lxdm的界面将session从default改为bspwm(可选列表内容也就是`/usr/share/xsessions`里的session名称, 而`default`并没有在目录里也会显示)  
重启机器了后之后可以打开浏览器到本页面复制粘贴命令运行  
使用`xrandr --dpi 192` 来临时设置分辨率(不过这种方法像firefox等一些应用不会改变行为), 之后会有提及永久设置的方法   
连接wifi：[NetworkManager cli版使用教程](https://huataihuang.gitbooks.io/cloud-atlas/content/os/linux/redhat/system_administration/network/networkmanager_nmcli.html)  
这里也简单列下命令  

```bash
sudo nmcli device wifi list # 列出(先scan)可选wifi
sudo nmcli device wifi connect bjut_wifi # 连接没密码的
sudo nmcli device wifi connect Leonardo password 12345678  # 连接有密码的
```

### 设置壁纸

```bash
sudo pacman -S feh
# 如 feh --bg-center $HOME/Pictures/background/1.jpg
# 在bspwm中添加命令来开机自启
```

### 安装基础软件(1)

```bash
# 记得根据预备中说的文档配置archlinuxcn源
sudo pacman -S archlinuxcn-keyring # cn 源中的签名（archlinuxcn-keyring 在 archlinuxcn）
sudo pacman -S yay # yay 命令可以让用户安装 AUR 中的软件（yay 在 archlinuxcn）



# 安装输入法, 之后会设置开机自启
# 安装好后记得fcitx5再打开设置, 添加中文输入法，以及设置快捷键和云拼音
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


### 安装窗口合成器

窗口合成器可以使窗口透明，阴影以及添加动效  
这里安装picom   

```bash
sudo pacman -S picom
mkdir ~/.config/picom
cd ~/.config/picom/
cp /usr/share/doc/picom/picom.conf.example ./picom.conf # 使用默认配置
# 如果没有nvidia gpu, 你应该关闭配置文件中的`vsync`选项
# vim ./picom.conf (转到行vsync = true, 改变其值为false)
echo 'picom &' >> ~/.config/bspwm/bspwmrc # 开机自启
```

### 安装polybar

```bash
sudo pacman -S polybar
mkdir /home/zarkli/.config/polybar
cd /home/zarkli/.config/polybar/
cp /usr/share/doc/polybar/examples/config.ini ./
```
(为polybar)添加启动脚本(参考[Polybar - Arch Wiki](https://wiki.archlinux.org/title/Polybar#Running_with_a_window_manager))  
编辑(创建)`$HOME/.config/polybar/launch.sh`文件: 

```bash
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

```bash
sudo pacman -S dunst
cp /etc/dunst/dunstrc /home/zarkli/.config/dunst/
echo 'dunst &' >> ~/.config/bspwm/bspwmrc # 开机自启
```


## 安装后续工作

### 安装fish bash (可选)

```bash
sudo pacman -S fish
chsh -s /bin/fish
```

### 安装基础软件(2)

```bash
yay -S google-chrome
# 刚开始可以使用goolge-chrome-stable --proxy-server=127.0.0.1:7890 来使用代理
sudo pacman -S ripgrep htop neofetch
sudo pacman -S xclip mpg123 # (optional)我的fish自定义函数需要
sudo pacman -S dolphin wget
sudo pacman -S ark p7zip gzip # ark can decompress 7z file with the support of p7zip(7z command), gzip is required during alacritty installation

# 安装nodejs 和 npm, 之所以不用nvm是因为nvm对fish不友好，而且我也不用node开发
sudo pacman -S nodejs npm
# 解决npm安装package需要root权限问题(安装到本地的~/.npm-global目录)
mkdir ~/.npm-global 
npm config set prefix '~/.npm-global'
# then add ~/.npm-global/bin to path

npm install -g neovim # only for neovim user
```
(仅对我个人)安装[alacritty](https://github.com/alacritty/alacritty)

### polybar 基础配置

对于一些符号的支持以及对于中文字体的支持需要更改字体  
这里我使用了`FiraCode Nerd Font`(不支持中文)

```bash
font-0 = FiraCode Nerd Font:size=16;0
```

#### 添加系统托盘
取消`tray-position = right`的注释  

```ini
tray-position=right
```

添加wifi图标
```bash
echo `nm-applet &` >> ~/.config/bspwm/bspwmrc
```

#### 其他配置参考

这里说下对于电池电量的显示： [Module:-battery](https://github.com/polybar/polybar/wiki/Module:-battery), 注意使用nerd font  


### 安装gpu驱动
见[archlinux 显卡驱动](https://arch.icekylin.online/rookie/graphic-driver.html)  

```bash
# 对我来说: intel & nvidia 并且我系统并没有开启对32位的支持
sudo pacman -S mesa vulkan-intel
sudo pacman -S nvidia nvidia-settings
yay -S optimus-manager optimus-manager-qt # can't open optimus-manager-qt ?
```

### u盘自动挂载

```bash
sudo pacman -S udisks2 udiskie
echo 'udiskie &' >> ~/.config/bspwm/bspwmrc
```

### 关机命令sudo不需要输入密码

参考: [Shutdown from terminal without entering password?](https://askubuntu.com/questions/168879/shutdown-from-terminal-without-entering-password)  

```bash
sudo EDITOR=vim visudo
```
然后添加下面语句

```
<your_username> ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown
```
如果做的更绝对一点可以alias一下使得连sudo都可以不用输入

### ranger安装以及配置(可选)

```bash
sudo pacman -S ranger
```
对于使用我的ranger配置文件，需要参考[README](./.config/ranger/README.md)


### 使用lightdm作为display manager

```bash
# 不要使用 lightdm-webkit2-greeter
# 尽管 lightdm-webkit2-greeter 主题很漂亮，但是貌似开发在2018年就停止来, 而且可能会遇到登陆错误（session of (username) is null), 并且速度也是问题
sudo pacman -S lightdm lightdm-gtk-greeter lightdm-slick-greeter
sudo systemctl disable lxdm
sudo systemctl enable lightdm

# 使用 lightdm-slick-greeter 作为lightdm 的greeter:
# 更改文件/etc/lightdm/lightdm.conf中的 [Seat:*] 部分的部分内容: 
# greeter-session=lightdm-slick-greeter
# user-session=bspwm  
```

#### lightdm-slick-greeter 简单配置
编辑`/etc/lightdm/slick-greeter.conf`(默认不存在这个文件，直接创建)  
注意修改下面的图片路径  

```
[Greeter]
background=/usr/share/backgrounds/1.jpg
```

当lightdm遇到错误的时候可以切换lightdm greeter或者切换display manager。（之前已经装了lxdm)


#### 安装lock screen

**在阅读本小节前请先完成 系统修复-> 电源按键以及笔记本合盖行为控制**  

```bash
sudo pacman -S betterlockscreen # https://github.com/betterlockscreen/betterlockscreen
betterlockscreen -u ~/Pictures/background/ # 使用这条命令更新图片缓存
betterlockscreen -l dimblur # 测试
```

可以在`~/.config/sxhkd/sxhkdrc`添加  

```
# lockscreen
alt + shift + x
    betterlockscreen -l dimblur
```
之后可以手动锁屏了  
如果要定时锁屏（没有鼠标键盘操作), 可以使用
```bash
sudo pacman -S xautolock
xautolock -time 1 -locker 'betterlockscreen -l dimblur' # 进行1分钟测试
# echo "xautolock -time 15 -locker 'betterlockscreen -l dimblur' &" >> ~/.config/bspwm/bspwmrc
```
由于我系统`suspend`会出现错误，我就没设置对`suspend`和`sleep`事件的锁屏了  


### 系统修复

#### 高分辨率屏幕设置
见[HiDPI - Arch Wiki](https://wiki.archlinux.org/title/HiDPI#Enlightenment) , [Xorg - Arch Wiki](https://wiki.archlinux.org/title/xorg#Setting_DPI_manually) 也有相关部分。
```bash
# 192是96(默认)的两倍，也就是放大2倍
echo 'Xft.dpi:192' >> ~/.Xresources 
```

#### 亮度设置

```bash
# brightness control
sudo pacman -S brightnessctl
```
在`sxhkdrc`中配置亮度按键（X环境中可以使用`xev`查看按键)

```
# Brightness control
XF86MonBrightness{Up,Down}
	brightnessctl s 10%{+,-}
```

#### 无声音问题

```bash
sudo pacman -S pulseaudio alsa-utils pulseaudio-alsa
pulseaudio --start # 然后重启

```
如果还是没声音(很有可能是硬件较新，参考[Advanced_Linux_Sound_Architecture#ALSA_firmware - Arch Wiki](https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture#ALSA_firmware))
```bash
sudo pacman -S sof-firmware alsa-ucm-conf 
```
在`sxhkdrc`中配置音量键
```
# Audio
XF86AudioRaiseVolume
	amixer set Master 5%+
XF86AudioLowerVolume
	amixer set Master 5%-
XF86AudioMute
	amixer set Master {mute, unmute}
```

#### 触摸板优化

比如点击只需要轻触即可，不需要按下  
参考：https://blog.csdn.net/qq_41932665/article/details/120855175

```bash
sudo pacman -S libinput xf86-input-synaptics
sudo cp /usr/share/X11/xorg.conf.d/70-synaptics.conf /etc/X11/xorg.conf.d
```
然后编辑 `/etc/X11/xorg.conf.d/70-synaptics.conf` 文件

```
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
```

#### 网络连接问题

这里我的网络连接问题是校园网连接了，但是却无法使用（也进不了登陆页面）  
我使用命令`sudo nmcli device wifi list`输出中可以看到很多校园网（相同名字，但是BSSID不同）  
参考[NetworkManager - DCHP client](https://wiki.archlinux.org/title/NetworkManager#DHCP_client) 一章节可以看到**需要关闭dhcpcd的systemd服务**,
前文说的[archlinux简明指南](https://arch.icekylin.online/)并没有提及关闭dhcpcd服务，这里需要格外注意。  
原因大致就是校园网每隔多少分钟会换个什么东西吧?  

#### 蓝牙连接问题
参考[在archlinux中使用蓝牙耳机](http://blog.lujun9972.win/blog/2017/07/18/%E5%9C%A8archlinux%E4%B8%AD%E4%BD%BF%E7%94%A8%E8%93%9D%E7%89%99%E8%80%B3%E6%9C%BA/)

```bash
sudo pacman -S bluez bluez-utils pulseaudio-bluetooth pulseaudio-alsa blueman
# bluez-utils 提供bluetoothctl工具
# pavucontrol则提供了pulseaudio的图形化控制界面 (这里我省略了)
# blueman 提供bluetooth GUI工具
sudo systemctl start --now bluetooth # 启动蓝牙服务
# pulseaudio --start # 之前应该已经有过，不然系统声音都没
sudo usermod -a -G lp $USER # 安装bluz后就应该会自动创建lp用户组了, 这里把用户加到组中 
# 可能需要重启下
# sudo reboot
```
使用`blueman-manager`命令打开图形化配置窗口  
```bash
# echo `blueman-applet &` >> ~/.config/bspwm/bspwmrc # 开机自启
```

#### 双系统显示时间不一致问题
这里说的是windows和linux双系统，其他的双（多）系统原因基本类似

参考：[Linux Windows 双系统时间不一致](https://sspai.com/post/55983)


#### 电源按键以及笔记本合盖行为控制

修改文件`/etc/systemd/logind.conf`文件中的下面条目  
我这里直接忽视合盖行为了, 因为默认的suspend行为(也就是`systemctl suspend`会使我电脑出问题，暂时没解决。但是盖子合到最下面不会熄屏，有点难受😣。  
```ini
HandlePowerKey=ignore
HandlePowerKeyLongPress=poweroff
HandleLidSwitch=ignore
HandleLidSwitchExternalPower=ignore
```
然后执行以下命令来应用选项  
```bash
sudo systemctl restart systemd-logind.service
```

#### 更改默认应用

```bash
# 更改默认终端，这样在rofi中打开ranger使用的终端就是alacritty
echo 'export TERMINAL="alacritty"' >> ~/.profile
```




### 系统美化

#### 安装FiraCode Nerd Font字体

```bash
yay -S nerd-fonts-fira-code
```
github 地址 : [nerd font](https://github.com/ryanoasis/nerd-fonts) 

#### 改变gtk主题

1. 安装主题`Layan-gtk-theme`

```bash
cd ./Downloads/
git clone https://github.com/vinceliuice/Layan-gtk-theme.git
cd ./Layan-gtk-theme/
# ls
# AUTHORS  COPYING  HACKING.md  install.sh  parse-sass.sh  README.md  src
./install.sh
```
2. 安装GUI般gkt主题设置工具lxappearance
```bash
sudo pacman -S lxappearance # use GUI apps to change the gtk theme (archwiki link: ...)
```

#### 改变qt主题

像 `dolphin`, `qterminal` 这些应用就是使用qt的  

```bash
sudo pacman -S qt5ct
# add QT_QPA_PLATFORMTHEME environment vairable (val: qt5ct)
# sudo vim /etc/environment
# QT_QPA_PLATFORMTHEME=qt5ct
# 编辑完后使用 super + alt + q 来退出 bspwm
```


#### fcitx 主题

使用[fcitx5-nord](https://github.com/ayamir/fcitx5-nord)

#### rofi 主题美化

安装[rofi themes collections](https://github.com/lr-tech/rofi-themes-collection)

(对于高分辨率屏幕可以自己二次修改样式表来放大)

#### dunst 主题

复制我的[配置](https://github.com/Ziqi-Yang/dotfiles/tree/main/.config/dunst)

#### 图标主题

下载[Deepin Icons 2022](https://store.kde.org/p/1678986/)   
解压后将其中的两个主题放到`~/.local/share/icons/`目录下  
可以使用`lxappearance` 和 `qt5ct`来应用图标  

#### GRUB主题

安装[GRUB-Theme](https://github.com/13atm01/GRUB-Theme)


#### 字体

```bash
mkdir ~/.local/share/fonts
cp -r ./assets/fonts/* ~/.local/share/fonts/
fc-cache -rv # update cache
# fc-list | grep -i zpix
```

#### 鼠标主题配置
1. 推荐[GoogleDot-Blue](https://www.pling.com/p/1215613)  
```bash
mv GoogleDot-Blue ~/.icons
```
2. 在`.bspwmrc`里添加
```
xsetroot -cursor_name left_ptr &
```
3. 修改`~/.config/gtk-3.0/settings.ini`文件里的鼠标主题
4. (可能要) 设置一下`lxappearance`  
5. (可能要) 修改 `~/.Xresources`， 添加行`Xcursor.theme: GoogleDot-Blue`

**参考**:  
1. [bspwm#Cursor themes do not apply to the desktop](https://wiki.archlinux.org/title/bspwm#Cursor_themes_do_not_apply_to_the_desktop)
2. [Cursor themes#LXAppearance](https://wiki.archlinux.org/title/Cursor_themes#LXAppearance)
3. [I3WM | BSPWM - Cursor theme.md](https://gist.github.com/abairo/5e2ed2faeadcc7abf43cda37826b2fbc#start-by-getting-the-correct-theme-name-to-use-in-the-next-steps)
