function dtupdate
  # use and to exit when error occurs
  cd ~/Documents/dotfiles
  and ./dotdrop.sh update -f
  and read -P "[press ENTER to continue]"
  and git add -A
  and git commit
  and git push
  and cd -
end
