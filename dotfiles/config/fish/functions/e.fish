function e
  # emacsclient -t --alternate-editor "" $argv
  emacs -nw --init-directory=~/.emacs.d_test $argv
end
