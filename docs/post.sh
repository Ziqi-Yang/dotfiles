#!/usr/bin/env bash
set -e # exit on error

# paru -S plymouth-git

# sudo cp /etc/mkinitcpio.conf /etc/mkinitcpio.conf.bak
# sudo sed -i -E 's/^HOOKS=\((.*)\)/HOOKS=(\1 plymouth)/' /etc/mkinitcpio.conf
# sudo mkinitcpio -p linux
# sudo mkinitcpio -p linux-zen

# sudo cp /etc/default/grub /etc/default/grub.bak
# sudo sed -i -E 's/GRUB_CMDLINE_LINUX_DEFAULT="(.*)"/GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 nowatchdog quiet splash"/' /etc/default/grub
# sudo grub-mkconfig -o /boot/grub/grub.cfg

# # systemctl status display-manager # show current display manager
# sudo systemctl disable lightdm
# sudo systemctl enable lightdm-plymouth

paru -S xdg-desktop-portal-hyprland-git

paru -S hyprpaper rofi-lbonn-wayland-git waybar-hyprland-git

paru -S ttf-zpix
# paru -S ttf-wps-fonts # use libreoffice instead

paru -S nerd-fonts-ibm-plex-mono

paru -S googledot-cursor-theme

# ./dotdrop.sh install --dry # dry run
./dotdrop.sh install

paru -S hyprpick selectdefaultapplication-git aur-auto-vote-git wudao-dict-git

paru -S fcitx5-pinyin-custom-pinyin-dictionary

paru -S aseprite

paru -S sioyek-git

paru -S yesplaymusic

# paru -S clash-for-windows-bin
paru -Sa clash-verge # install aur package(self build), not archlinuxcn package(meet error)

paru -S wemeet-bin zoom

paru -S electronic-wechat-uos-bin

paru -S emacs29-git

paru -S gitleaks

paru -S lldb-mi-git

pip3 install ptvsd debugpy pygments --user

pip install pyright pytest nose black pyflakes isort

rustup component add rustfmt-preview clippy-preview
cargo install cargo-check

pip install cmake-language-server --user
paru -S rtags-git

go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/stamblerre/gocode@latest
go install golang.org/x/tools/cmd/godoc@latest
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/cmd/gorename@latest
go install golang.org/x/tools/cmd/guru@latest
go install github.com/cweill/gotests/gotests@latest
go install github.com/fatih/gomodifytags@latest
paru -S golangci-lint-bin gopls

paru -S bashdb

npm install -g @volar/vue-language-server

paru -S fvm-bin
fvm install stable
fvm global stable

nvm install latest
nvm use latest

paru -S ltex-ls-bin wakatime wordnet-cli cht.sh-git
npm install -g browser-sync # live web preview

# paru -S proxzima-plymouth-git
# sudo plymouth-set-default-theme -R proxzima

paru -S uair
pip install requests

paru -S python-xlsx2csv

paru -S layan-gtk-theme-git

paru -S fcitx5-nord

env all_proxy=127.0.0.1:7890 dotfiles/Public/matter/my_command.sh

chsh -s /bin/fish
