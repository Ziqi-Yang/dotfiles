# custom keybindings for fish
# use `man bind` to see all possible commands
function fish_user_key_bindings
  # vim
  ## insert modee
  bind -M insert \cA 'beginning-of-line'
  bind -M insert \cE 'end-of-line'
  bind -M insert \v  'kill-line'
  bind -M insert \cF 'forward-char'
  bind -M insert \cB 'backward-char'
  bind -M insert \ef 'forward-word'
  bind -M insert \eb 'backward-word'
end
