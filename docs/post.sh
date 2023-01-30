#!/usr/bin/env bash
set -e # exit on error

paru -S xdg-desktop-portal-hyprland-git

paru -S hyprpaper rofi-lbonn-wayland-git waybar-hyprland-git

paru -S ttf-zpix

paru -S nerd-fonts-ibm-plex-mono

paru -S googledot-cursor-theme

paru -S hyprpick fzf trash-cli zoxide jq

paru -S fcitx5-pinyin-custom-pinyin-dictionary

sudo pacman -S gwenview imv

paru -S aseprite

paru -S emacs29-git

paru -S lldb-mi-git

pip3 install ptvsd --user
pip3 install debugpy --user

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

paru -S ltex-ls-bin wakatime wordnet-cli
npm install -g browser-sync # live web preview

paru -S python-xlsx2csv

paru -S layan-gtk-theme-git

paru -S fcitx5-nord

gfw dotfiles/Public/matter/my_command.sh

nvm install latest
nvm use latest

chsh -s /bin/fish
