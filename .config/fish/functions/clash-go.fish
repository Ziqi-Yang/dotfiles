function clash-go
    if test "$argv" = "" # if no argument is passed
        echo current configuration: zcjd \(1\) \; starlink \(2\)
        echo --------------------
        echo Usage: clash-config [condition]
        echo Example: clash-config 1 ---- will use the configuration 1
        echo Example: clash-config zcjd ---- will use the configuration jcnf
        return 1
    end

    pm2 start clash
    echo -e "[\033[33mClash is triggered, you can enjoy your time while the program is going to update your profile\033[0m]"
    echo -e "[\033[33mUsing config at ~/.config/fish/resources/generate.ini\033[0m]"
    cp /home/zarkli/.config/fish/resources/generate.ini /home/zarkli/Public/subconverter/generate.ini
    echo -e "[Executing command \033[33m ~/Public/subconverter/subconverter -g &> /dev/null\033[0m silently]"
    ~/Public/subconverter/subconverter -g &> /dev/null
    if test $argv[1] = "zcjd" ;or test $argv[1] = 1
        cp ~/.config/clash/others/zcjd.yaml ~/.config/clash/config.yaml
        echo -e "[\033[33mUsing zcjd configuration\033[0m]"
    else if test $argv[1] = "starlink" ;or test $argv[1] = 2
        cp ~/.config/clash/others/starlink.yaml ~/.config/clash/config.yaml
        echo -e "[\033[33mUsing starlink configuration\033[0m]"
    end
    echo -e "[Execute command \033[33mpm2 start/restart clash\033[0m]"
    echo "-----------------------------------------"
    echo 
    pm2 restart clash

    echo
    echo "-----------------------------------------"
    set subconverterV (curl -s --connect-timeout 3 "https://api.github.com/repos/tindy2013/subconverter/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')
    echo -e "\033[33msubconverter\033[0m : latest-version \033[33m$subconverterV\033[0m ;current-version \033[33m0.7.2\033[0m)"
end

