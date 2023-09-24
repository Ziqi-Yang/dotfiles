#!/usr/bin/env fish

function yazi
    set tempfile (mktemp -t tmp.XXXXXX)
    command yazi --cwd-file=$tempfile
    if test -s $tempfile
        set yazi_pwd (cat $tempfile)
        if test -n $yazi_pwd -a -d $yazi_pwd
            builtin cd -- $yazi_pwd
        end
    end

    command rm -f -- $tempfile
end
