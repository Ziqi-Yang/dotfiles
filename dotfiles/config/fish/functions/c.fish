#!/usr/bin/env fish

# choose clipboard history use fzf
function c
    clipman pick --print0 --tool=CUSTOM --tool-args="fzf --prompt 'pick > ' --bind 'tab:up' --cycle --read0"
end
