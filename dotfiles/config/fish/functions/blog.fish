#!/usr/bin/env fish

function blog
    cd ~/Documents/blog
    git add -A
    git commit
    git push
	cd -
end
