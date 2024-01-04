function ,ev
    # emacsclient -t --alternate-editor "" $argv
    env EMACS-MIN=1 nemacs --eval "(mk/global-read-only-mode)" $argv
end
