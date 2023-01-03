#!/usr/bin/env fish

# terminal hex viewer
function hex
    hexyl $argv | less -R
end
