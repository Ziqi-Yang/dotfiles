function dtupdate
  cd ~/Documents/dotfiles
  ./sync.sh
  git add -A
  git commit
  git push
  cd -
end
