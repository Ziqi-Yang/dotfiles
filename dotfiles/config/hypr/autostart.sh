#!/usr/bin/bash

~/.config/hypr/xdpw &
/usr/lib/polkit-kde-authentication-agent-1 &

hyprpaper --no-fractional &
dunst &
waybar &
udiskie &
gammastep-indicator &
fcitx5 -d --replace &
/opt/clash-for-windows-bin/cfw &
# xautolock -time 15 -locker 'betterlockscreen -l dimblur' &
blueman-applet &

emacs --daemon &
wl-paste -t text --watch clipman store &

# not-working apps
# nm-applet & # cannot stay within waybar tray
# megasync & # cannot work on wayland
# ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize & # cannot stay within waybar tray
