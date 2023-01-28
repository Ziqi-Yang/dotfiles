function pinit_go -a 'packageName'
  set template "$HOME/.config/fish/project_templates/go"
  cp -rT $template "$packageName" # use -T to also copy hidden files
  sed -i "s/#{packageName}#/$packageName/g" ./$packageName/README.org
  cd "$packageName"
  go mod init github.com/Ziqi-Yang/$packageName
  cd ..
end
