# custom keybindings for fish
# `man bind`
# use `fish_key_reader` to show key input character code
function fish_user_key_bindings
  # vim
  ## insert mode
  bind -M insert \cA 'beginning-of-line'
  bind -M insert \cE 'end-of-line'
  bind -M insert \b 'backward-kill-word'
  bind -M insert \v  'kill-line'
  bind -M insert \cF 'forward-char'
  bind -M insert \cB 'backward-char'
  bind -M insert \ef 'forward-word'
  bind -M insert \eb 'backward-word'

  bind -M insert \cz '_zoxide-select'
end
