function clock
    if set -q $argv # if no argument is passed
        echo --------------------
        echo please provide an argument to set minutes
        echo --------------------
        echo example:
        echo clock 20 # clock will start at 20m later
        return 1
    end
    echo The clock will ring in {$argv} minutes
    sleep {$argv}m | pv -t
    # 循环3次,C-c停止
    mpv "/home/zarkli/.config/fish/resources/amazarashi - 季節は次々死んでいく.mp3" && mpv "/home/zarkli/.config/fish/resources/amazarashi - 季節は次々死んでいく.mp3" && mpv "/home/zarkli/.config/fish/resources/amazarashi - 季節は次々死んでいく.mp3"
end
