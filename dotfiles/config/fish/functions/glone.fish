#!/usr/bin/env fish

# git clone the lastest main/master branch

function glone -a 'url'
    git clone --depth=1 --single-branch -b main $url || git clone --depth=1 --single-branch -b master $url
end
