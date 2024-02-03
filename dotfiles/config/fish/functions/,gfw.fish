function ,gfw
    if test "$argv" = "" # if no argument is passed
        echo set global proxy to 127.0.0.1:7890
        export all_proxy=http://127.0.0.1:7890
        return 0
    end

    env all_proxy=http://127.0.0.1:7890 $argv
end
