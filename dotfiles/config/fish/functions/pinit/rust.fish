function pinit_rust -a 'packageName'
  set year (date +'%G')
  set copyright_holders "Ziqi Yang"
  set template "$HOME/.config/fish/project_templates/rust"
  cargo new "$packageName"
  cp -rT $template "$packageName" # use -T to also copy hidden files

  sed -i "s/#{packageName}#/$packageName/g" ./$packageName/README.md

  sed -i "s/#{NAME}#/$packageName/g" ./$packageName/Cargo.toml

  sed -i "3s/<year>/$year/g" ./$packageName/LICENSE
  sed -i "3s/<copyright holders>/$copyright_holders/g" ./$packageName/LICENSE
end
