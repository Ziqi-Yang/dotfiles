function dtupdate
  # use and to exit when error occurs
  cd ~/Documents/dotfiles
  and ./sync.sh
  and read -P "[press ENTER to continue]"
  and git add -A
  and git commit
  and git push
  and cd -
end
