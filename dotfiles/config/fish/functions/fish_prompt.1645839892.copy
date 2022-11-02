function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # Dream
    set_color -o cyan
    echo -n "┌──"

    # User
    echo -n "("
    set_color -o red
    echo -n $USER
    set_color normal

    echo -n ㉿

    # Host
    set_color -o red 
    echo -n (prompt_hostname)
    set_color normal


    set_color -o cyan
    echo -n ")" 

    set_color cyan
    echo -n '-<'
    set_color -o yellow
    echo -n 'Saber'
    set_color cyan
    echo -n '>-'
    set_color -o cyan
    echo -n '['

    # PWD
    set_color -o $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    set_color -o cyan
    echo -n ']'

    __terlar_git_prompt
    fish_hg_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    set_color -o cyan
    echo -n '└─'
    set_color -o red
    echo -n '$ '
    set_color normal
end

