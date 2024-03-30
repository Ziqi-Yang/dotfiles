function fish_greeting
    if [ "$TERM" = "xterm-kitty" ]
        $HOME/.pokemon-icat/pokemon-icat.sh -s
    else
        ~/.config/fish/myScript/greetings/crunchbang-mini
    end
    # ultralist l group:p
end
