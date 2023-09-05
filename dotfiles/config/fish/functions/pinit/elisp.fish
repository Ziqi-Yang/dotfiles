function pinit_elisp -a 'packageName'
  set template "$HOME/.config/fish/project_templates/elisp"
  cp -rT $template "$packageName" # use -T to also copy hidden files
  sed -i "s/#{packageName}#/$packageName/g" ./$packageName/README.md
end
