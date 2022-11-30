function pinit_cc -a 'packageName'
  set template "$HOME/.config/fish/project_templates/cc"
  cp -rT $template "$packageName" # use -T to also copy hidden files
  sed -i "s/#{packageName}#/$packageName/g" ./$packageName/README.org
end
