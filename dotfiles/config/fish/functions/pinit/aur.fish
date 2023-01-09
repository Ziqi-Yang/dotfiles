function pinit_aur -a 'packageName'
  set template "$HOME/.config/fish/project_templates/aur"
  cp -rT $template "$packageName" # use -T to also copy hidden files
  cp /usr/share/pacman/*.proto "$packageName/"
  sed -i "1s/##PKG_NAME##/$packageName/" "$packageName/Makefile"
end
