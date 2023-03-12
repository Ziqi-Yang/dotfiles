#!/usr/bin/bash
# dunst & # seems like sway auto start it
# waybar & # sway bar 
udiskie &
gammastep-indicator &
fcitx5 -d --replace &
clash-verge &
# xautolock -time 15 -locker 'betterlockscreen -l dimblur' &
blueman-applet &

emacs --daemon &
wl-paste -t text --watch clipman store &

# not-working apps
# nm-applet & # cannot stay within waybar tray
# megasync & # cannot work on wayland
# ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize & # cannot stay within waybar tray
