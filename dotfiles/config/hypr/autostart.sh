#!/usr/bin/bash

~/.config/hypr/xdpw &
/usr/lib/polkit-kde-authentication-agent-1 &

hyprpaper &
dunst &
waybar &
# nm-applet & # no effect in waybar
udiskie &
fcitx5 -d --replace &
/opt/clash-for-windows-bin/cfw &
# xautolock -time 15 -locker 'betterlockscreen -l dimblur' &
blueman-applet &

# megasync &
~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize &
emacs --daemon &
wl-paste -t text --watch clipman store &
