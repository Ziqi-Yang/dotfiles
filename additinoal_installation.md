# Additinoal Installation


## python & plugins

```bash
sudo pacman -S python python-pip
pip --install pynvim
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
```


## git

```bash
sudo pacman -S git
git config --global user.name [username]
git config --global user.email [email]
ssh-keygen -t ed25519 -C "your_email@example.com"
```

## mega

```bash
sudo pacman -S megasync
```

## poweroff without sudo

https://askubuntu.com/questions/168879/shutdown-from-terminal-without-entering-password  
