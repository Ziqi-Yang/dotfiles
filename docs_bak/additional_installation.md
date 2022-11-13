# Additinoal Installation

## python & plugins

```bash
sudo pacman -S python python-pip
pip install pynvim
```

## go

```bash
sudo pacman -S go
go env -w GO111MODULE=on
go env -w GOPROXY=https://goproxy.cn,direct
mkdir -p ~/go/src
echo 'export PATH="$PATH:$HOME/go/bin"' > ~/.bashrc
# add ~/go/bin to path in fish shell
```

## java

```bash
sudo pacman -S jdk-openjdk
# 解决awt swing只显示灰色窗口，不显示内容问题
echo "export _JAVA_AWT_WM_NONREPARENTING=1" >> ~/.profile
```


## git

```bash
sudo pacman -S git
git config --global user.name [username]
git config --global user.email [email]
ssh-keygen -t ed25519 -C "your_email@example.com"
git config --global core.editor "nvim"
git config --global https.proxy http://127.0.0.1:7890
git config --global https.proxy https://127.0.0.1:7890
```

## mega

```bash
sudo pacman -S megasync
echo 'megasync &' >> ~/.config/bspwm/bspwmrc
```

## kdeconnect

```bash
sudo pacman -S kdeconnect
kdeconnect-app # to pair with your phone first
echo "kdeconnect-indicator &" >> ~/.config/bspwm/bspwmrc
```

## redshift

```bash
sudo pacman -S redshift
```
then copy my config folder into ~/.config

## flameshot

```bash
sudo pacman -S flameshot
```

## neovim

1. 
```bash
sudo pacman -S neovim
```

2. 安装[astrovim](https://astronvim.github.io/)  

3.
```bash
mkdir ~/.config/nvim/lua/user/
curl "https://raw.githubusercontent.com/Ziqi-Yang/astronvim_config/main/init.lua" -o ~/.config/nvim/lua/user/init.lua
```

## emacs
doom emacs  
见[我的配置文件](https://github.com/Ziqi-Yang/.doom.d)  


## Intellij

安装插件: `ideavim`, `whichkey`, `acejump`, `github theme`

```shell
curl "https://raw.githubusercontent.com/Ziqi-Yang/ide_vim_configs/main/ideavimrc" -o ~/.ideavimrc
```

## rofi addons

1. [rofi-calc](https://github.com/svenstaro/rofi-calc) 计算器
2. [rofimoji](https://github.com/fdw/rofimoji) 表情包选择
3. [greenclip](https://github.com/erebe/greenclip) 剪切板管理
```bash
sudo pacman -S greenclip
```

## jgmenu

提供了折叠菜单的功能，以及可以配制成鼠标处显示，桌面右键菜单等等

```
sudo pacman -S jgmenu
```

## manage default application
use [Select Default Application](https://github.com/sandsmark/selectdefaultapplication), its aur address [selectdefaultapplication-git](https://aur.archlinux.org/packages/selectdefaultapplication-git)

theory:
1. [XDG MIME Applications](https://wiki.archlinux.org/title/XDG_MIME_Applications)
2. [xdg-utils](https://wiki.archlinux.org/title/Xdg-utils)

## Terminal Beautiful Program

### colorscripts

[shell-color-scripts](https://gitlab.com/dwt1/shell-color-scripts)

```bash
yay -S shell-color-scripts
```

### pipes.sh

[pipes.sh](https://github.com/pipeseroni/pipes.sh)

```bash
yay -S pipes-sh
```

## zathura

pdf-reader

[zathura archwiki](https://wiki.archlinux.org/title/zathura)  
themes: [catppuccin/zathura](https://github.com/catppuccin/zathura)  

```bash
sudo pacman -S zathura zathura-cb zathura-djvu zathura-pdf-mupdf
```

## other

paru and bat
