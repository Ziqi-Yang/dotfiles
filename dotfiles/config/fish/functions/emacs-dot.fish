#!/usr/bin/env fish

# change emacs dotfiles on the fly
function emacs-dot -a 'dot'
    if test -n "$dot"
        ln -sfT ~/.emacs.d_$dot ~/.emacs.d
    else
        echo [usage]
        echo emacs-dot $dotname
        echo [available options]
        echo $dotname: custom, doom
        echo [example]
        echo emacs-dot doom
    end
end
