function cal
  source ~/.config/fish/functions/clip.fish
  set x "rgb(";
  set x "$x$(qalc -t "$argv[1] * 250"),"
  set x "$x$(qalc -t "$argv[2] * 250"),"
  set x "$x$(qalc -t "$argv[3] * 250"))"
  echo $x | clip
  echo $x
end
