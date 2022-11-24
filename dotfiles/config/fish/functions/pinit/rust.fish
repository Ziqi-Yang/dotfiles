function pinit_rust -a 'packageName'
  set template "$HOME/.config/fish/project_templates/rust"

  cargo new "$packageName"

  cp -rT $template "$packageName" # use -T to also copy hidden files

  sed -i "s/#{packageName}#/$packageName/g" ./$packageName/README.org
end
