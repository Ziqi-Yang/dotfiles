#!/usr/bin/env bash

wid="$1"
class="$2"
instance="$3"
consequences="$4"
title="$(xdotool getwindowname "$wid")"

# emacs-everywhere
[ "$title" = "emacs-everywhere" ] && echo 'state=floating rectangle=1600x1000+800+500'
