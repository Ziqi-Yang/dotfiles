function _zoxide-select
    set -f zoxide_path (zoxide query --interactive)

    if test $status -eq 0
        commandline --replace -- "$(commandline) $zoxide_path"
    end

    commandline --function repaint
end
