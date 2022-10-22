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

## copyq

剪切板管理工具

```shell
sudo pacman -S copyq
```

## rofi addons

1. [rofi-calc](https://github.com/svenstaro/rofi-calc)
2. [rofimoji](https://github.com/fdw/rofimoji)
