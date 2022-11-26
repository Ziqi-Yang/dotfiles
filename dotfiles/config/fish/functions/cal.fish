function cal
  source ~/.config/fish/functions/clip.fish
  qalc -t "$argv[1] / 250" | clip
end
