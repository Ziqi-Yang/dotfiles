#!/bin/env bash
# only two session named "work" and "rest" in uair.toml

work_count=1
rest_count=1
loop_num=4

# echo '{"text": "", "class": "begining"}'
echo ''
while true
do
    while read -r line; do
        read -a line <<< "$line"
        if [[ "${line[0]}" == "work" ]]; then
            message="<span color='red'></span> [${work_count}/${loop_num}] ${line[0]} ${line[1]}"
            if [[ "${line[1]}" == "0s" ]]; then
                work_count=$(( "$work_count" % "$loop_num" + 1 ))
            fi
            class="work"
        elif [[ "${line[0]}" == "rest" ]]; then
            message="<span color='darkgray'></span> [${rest_count}/${loop_num}] ${line[0]} ${line[1]}"
            if [[ "${line[1]}" == "0s" ]]; then
                rest_count=$(( "$rest_count" % "$loop_num" + 1 ))
            fi
            class="reset"
        else
            message="Error!"
            class="error"
        fi
        # echo '{"text": '\"$message\"', "class": '\"$class\"'}'
        echo "$message"
    done < <(uair)

    # to deal with 'address is already in use error'
    pkill uair
    sleep 1
done
