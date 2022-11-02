#!/bin/bash
#sync all config files into local_repo
set -e

local_repo="$HOME/Documents/dotfiles"

# ============= configuration ================
# ----- folder
# link to other variables of folder
folder_vars=("config_folders" "single_folders")
# ~/.config; no subfolder allowed (e.x. polybar/scripts)
config_folders=("alacritty" "bspwm" "dunst" "fish" "neofetch" 
  "picom" "polybar" "ranger" "redshift" "rofi" "sxhkd" "eww" "jgmenu"
  "zathura"
)

# single folders are based on $HOME
single_folders=("myBin" ".local/share/rofi/themes")

# ----- files(root: home)
files=(".xsession" ".Xresources" ".ideavimrc" ".todos.json" ".vimrc" ".gitconfig"
  ".config/rofimoji.rc" ".config/nvim/lua/user/init.lua" ".config/mimeapps.list"
  ".config/Code - OSS/User/settings.json"
)


# ============== sync ========================
echo "[#] sync start"
echo
# ----- folders
echo "[*] folders"
for var in "${folder_vars[@]}"; do 
  folders=$var[@]

  if [[ $var == "config_folders" ]]; then

    prefix="$HOME/.config"
    local_path="$local_repo/.config"

    for f2 in "${!folders}"; do
      mkdir -p "$local_path"
      fullpath="$prefix/$f2"
      cp "$fullpath" "$local_path" -rf
      echo "$fullpath --- done"
    done

  elif [[ $var == "single_folders" ]]; then
    for f2 in "${!folders}"; do
      fullpath="$HOME/$f2"
      local_full_path="$local_repo/$f2"
      local_parent_path=$(dirname "$local_full_path")
      mkdir -p "$local_parent_path"
      cp "$fullpath" "$local_parent_path" -rf
      echo "$fullpath --- done"
    done

  else

    echo "error!"
    exit -1

  fi

done

echo
echo "--------------------------"
echo
# ----- files
echo "[*] files"
for f in "${files[@]}"; do
  fullpath="$HOME/$f"
  local_full_path="$local_repo/$f"
  local_folder=$(dirname "$local_full_path")
  mkdir -p "$local_folder"
  cp "$fullpath" "$local_full_path" -f
  echo "$fullpath --- done"
done

echo
echo "[#] sync done"
