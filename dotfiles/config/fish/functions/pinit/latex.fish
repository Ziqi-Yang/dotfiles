function pinit_latex -a 'packageName'
  set template "$HOME/.config/fish/project_templates/latex"
  cp -rT $template "$packageName" # use -T to also copy hidden files
end
