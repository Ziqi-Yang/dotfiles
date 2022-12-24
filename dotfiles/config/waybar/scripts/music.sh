#!/usr/bin/env bash

max_metadata_length=15
is_live=$(playerctl --all-players status 2>/dev/null | grep -v "Stopped")
if [[ $? -eq 0 ]]; then
    artist="$(playerctl metadata artist)"
    title="$(playerctl metadata title)"
    if [[ -n "$artist" ]]; then
        metadata="$title - $artist"
    else
        metadata="$title"
    fi

    metadata="$(echo ${metadata} | sed 's/\(.\{'${max_metadata_length}'\}\).*/\1.../')"
    is_playing=$(playerctl --all-players status 2>/dev/null | grep "Playing")
fi


if  [[ -n "$is_playing" ]]; then # playing
    echo "<span color='#bdc3c7'></span>  <span color='#d35400'></span> <span color='#D8DEE9'>$metadata</span>  <span color='#bdc3c7'></span>"
elif [[ -n "$is_live" ]]; then # paused
    echo "<span color='#bdc3c7'></span>  <span color='#d35400'></span> <span color='#D8DEE9'>$metadata</span>  <span color='#bdc3c7'></span>"
else # stopped & no player
    echo "<span color='#7f8c8d'>[ No Music Playing ]</span>"
fi
