#!/bin/bash

get_trash() {
  SIZE=$(du -sh $HOME/.local/share/Trash/files | awk '{ printf $1}');
  TRASHSIZE=$( du -s ~/.local/share/Trash/files/ | awk '{ printf $1}' );
  LIMIT_TRASH=$(printf 8000000);
}

get_trash
echo $SIZE

if (("$TRASHSIZE" > "$LIMIT_TRASH")); then
trash-empty -f
fi
