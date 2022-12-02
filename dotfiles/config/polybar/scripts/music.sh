#!/usr/bin/env bash

is_playing=$(playerctl --all-players status 2>/dev/null | grep Playing)
is_live=$(playerctl --all-players status 2>/dev/null | grep -v "Stopped")
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl metadata artist) - $(playerctl metadata title)"
fi

if  [[ -n "$is_playing" ]]; then
    echo "%{F#bdc3c7}  %{F#d35400} %{F#27ae60}$metadata  %{F#bdc3c7}%{F-}"
elif [[ -n "$is_live" ]]; then
    echo "%{F#bdc3c7}  %{F#d35400} %{F#7f8c8d}$metadata  %{F#bdc3c7}%{F-}"
else # Stopped & no player
    echo "[ No Music Playing ]"
fi
