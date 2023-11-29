#!/usr/bin/bash

# dunst & # seems like sway auto start it
# waybar & # sway bar 
udiskie &
fcitx5 -d --replace &
# xautolock -time 15 -locker 'betterlockscreen -l dimblur' &
blueman-applet &
hiddify-next &
gammastep-indicator &

# emacs --daemon &
wl-paste -t text --watch clipman store &
swaymsg "workspace 1; exec kitty;" &

# avoid consuming to much resources at system startup
sleep 1 && firefox-developer-edition &

# not-working apps
# nm-applet & # cannot stay within waybar tray
# megasync & # cannot work on wayland
# ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize & # cannot stay within waybar tray
