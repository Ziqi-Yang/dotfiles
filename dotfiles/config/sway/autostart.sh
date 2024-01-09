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
wl-paste --watch cliphist store &
swaymsg "workspace 1; exec kitty;" &

foot --server &

telegram-desktop &
firefox-developer-edition &

# enter gpg password (used for gpg agent), so offlineimap sync in crontab can
# work correctly
sleep 3 && pass nonsense_password &

# not-working apps
# nm-applet & # cannot stay within waybar tray
# megasync & # cannot work on wayland
# ~/.local/share/JetBrains/Toolbox/bin/jetbrains-toolbox --minimize & # cannot stay within waybar tray
