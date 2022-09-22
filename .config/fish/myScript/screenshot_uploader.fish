deepin-screenshot -n -s /tmp/screenshot.png
set a (curl -s -H "Authorization: ***REMOVED***" -H "Content-Type: multipart/form-data" -X POST -F smfile="@/tmp/screenshot.png" -F format="json" https://sm.ms/api/v2/upload | jq ".data.url" -r)
echo -n $a | xclip -sel clip
notify-send -a screenshot_uploader -u low "screenshot has been uploaded,and link is copyed" # need to install libnotify
