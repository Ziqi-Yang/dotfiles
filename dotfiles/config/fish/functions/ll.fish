#!/usr/bin/env fish

function ll --wraps=exa --description 'List contents of directory using long format by exa'
  eza -bghliS --git --icons $argv
end
