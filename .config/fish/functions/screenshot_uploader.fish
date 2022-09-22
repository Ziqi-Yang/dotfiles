function screenshot_uploader
    deepin-screenshot -s /tmp/screenshot.png -n
    picgo u /tmp/screenshot.png > /tmp/screenshot.txt
    tail -n 1 /tmp/screenshot.txt | xargs echo -n | xclip -selection clipboard # for that picgo's plugin autocopy would add line break
    notify-send -a screenshot_uploader -u low "screenshot has been uploaded,and link is copyed" # need to install libnotify
end
