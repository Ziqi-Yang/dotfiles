#!/bin/fish
# gitui issue: https://github.com/extrawurst/gitui/issues/1458
# solution: https://github.com/extrawurst/gitui/issues/1458#issuecomment-1498609995
function gui --description 'gitui'
  ssh-add ~/.ssh/id_ed25519 && gitui
end
