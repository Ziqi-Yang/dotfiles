#!/bin/bash
#sync all config files
set -e

local_repo="$HOME/Documents/dotfiles"

# ============= configuration ================
# ----- folder
#link to other variables of folder
folder_vars=("config_folders" "rofi_themes")
# folders in the ~/.config directory
config_folders=("alacritty" "bspwm" "dunst" "fish" "neofetch" 
  "picom" "polybar" "ranger" "redshift" "rofi" "sxhkd")
# themes folder in the ~/.local/share/rofi directory (single folder)
rofi_themes=("themes")

# ----- files(root: home)
files=(".xsession" ".config/rofimoji.rc" ".Xresources" ".ideavimrc" ".todos.json" ".vimrc" ".gitconfig")


# ============== sync ========================
echo "[#] sync start"
echo
# ----- folders
echo "[*] folders"
for var in ${folder_vars[@]}; do 
  folders=$var[@]
  if [[ $var == "config_folders" ]]; then
    prefix="$HOME/.config"
    local_path="$local_repo/.config"
  elif [[ $var == "rofi_themes" ]]; then
    prefix="$HOME/.local/share/rofi"
    local_path="$local_repo/.local/share/rofi"
  else
    echo "error!"
    exit -1
  fi

  for f2 in ${!folders}; do
    mkdir -p $local_path
    fullpath="$prefix/$f2"
    cp $fullpath $local_path -rf
    echo "$fullpath --- done"
  done
done

echo
echo "--------------------------"
echo
# ----- files
echo "[*] files"
for f in ${files[@]}; do
  fullpath="$HOME/$f"
  local_folder="$local_repo/$(dirname $f)"
  local_full_path="$local_repo/$f"
  mkdir -p $local_folder
  cp $fullpath $local_full_path -f
  echo "$fullpath --- done"
done

echo
echo "[#] sync done"
