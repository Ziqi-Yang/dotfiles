function clip
    if string match -q $XDG_SESSION_TYPE "wayland"
        wl-copy -n
    else # x11
        xclip -r -sel clip
    end
end
