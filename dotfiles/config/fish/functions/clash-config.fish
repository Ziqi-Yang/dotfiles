function clash-config
    if test "$argv" = "" # if no argument is passed
        echo current configuration: zcjd \(1\) \; starlink \(2\)
        echo --------------------
        echo Usage: clash-config [condition]
        echo Example: clash-config 1 ---- will use the configuration 1
        echo Example: clash-config jcnf ---- will use the configuration jcnf
        return 1
    end

    set url_1 "https://subcon.dlj.tf/sub?target=clash&new_name=true&url="
    set url_3 "&insert=false&config=https%3A%2F%2Fraw.githubusercontent.com%2FACL4SSR%2FACL4SSR%2Fmaster%2FClash%2Fconfig%2FACL4SSR_Online.ini"

    set condition_1 "https%3A%2F%2Fzcjd.top%2Fapi%2Fv1%2Fclient%2Fsubscribe%3Ftoken%3D15bc23de3b24c0b936711e33e6ea3319"
    set condition_2 "https%3A%2F%2Fsub.starlink9527.xyz%2Fapi%2Fv1%2Fclient%2Fsubscribe%3Ftoken%3D7ad85b5b97d240628cc57103092ef1cd"

    if test $argv[1] = "jcnf" ;or test $argv[1] = 1
        echo -e "\033[33m[Using jcnf configuration]"
        set url_2 $condition_1
        # urlEncoder variable
        echo -e "[execute curl into ~/.config/clash/others/jcnf.yaml]\033[0m"
        curl {$url_1}{$url_2}{$url_3} -o ~/.config/clash/others/jcnf.yaml
        echo -e "\033[33m[copy configuration]\033[0m"
        cp ~/.config/clash/others/jcnf.yaml ~/.config/clash/config.yaml
    else if test $argv[1] = "starlink" ;or test $argv[1] = 2
        echo -e "\033[33m[Using starlink configuration]"
        set url_2  $condition_2
        echo -e "[execute curl into ~/.config/clash/others/starlink.yaml]\033[0m"
        curl {$url_1}{$url_2}{$url_3} -o ~/.config/clash/others/starlink.yaml
        echo -e "\033[33m[copy configuration]\033[0m"
        cp ~/.config/clash/others/starlink.yaml ~/.config/clash/config.yaml
    end
    echo -e "\033[33m[execute pm2 start/restart clash]\033[0m"
    # pm2 restart clash
    pm2 start clash
    echo -e "\033[33mDone!\033[0m"
end
