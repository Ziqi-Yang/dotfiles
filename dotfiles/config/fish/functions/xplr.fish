#!/usr/bin/env fish
# in xplr use Q ( xplr.config.modes.builtin.quit.key_bindings.on_key.p )
# to exit and cd into the exit directory

function xplr
        set tempfile (mktemp -t tmp.XXXXXX)
        set command_argument "map Q chain shell echo %d > $tempfile; quitall"
        command xplr $argv > $tempfile
        if test -s $tempfile
                set xplr_pwd (cat $tempfile)
                if test -n $xplr_pwd -a -d $xplr_pwd
                        builtin cd -- $xplr_pwd
                end
        end

        command rm -f -- $tempfile
end
