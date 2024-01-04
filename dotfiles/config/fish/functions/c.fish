#!/usr/bin/env fish

# choose clipboard history use fzf
function c
    echo (commandline | tr -d \n)
end
