#!/usr/bin/env bash

wid="$1"
class="$2"
instance="$3"
consequences="$4"
title="$(xdotool getwindowname "$wid")"

# emacs-everywhere
if [[  "$title" = "emacs-everywhere"  ]]; then
    echo 'state=floating rectangle=1600x1000+800+500'
elif [[  "$title" = "scratchemacs-frame"  ]]; then
    echo 'state=floating rectangle=1600x1000+800+500'
fi
