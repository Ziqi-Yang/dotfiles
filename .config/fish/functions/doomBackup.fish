function doomBackup
    7z a /tmp/doomBackup.7z ~/.emacs.d ~/.doom.d
    echo
    echo -e "\033[33m[The achieved file is at /tmp/doomBackup.7z]\033[0m"
end
