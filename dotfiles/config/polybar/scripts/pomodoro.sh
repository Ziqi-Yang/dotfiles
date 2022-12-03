#!/bin/env bash
# only two session named "work" and "rest" in uair.toml

work_count=1
rest_count=1
loop_num=4

echo "%{F#7f8c8d}%{F-}"
while true
do
    while read -r line; do
        read -a line <<< "$line"
        if [[ "${line[0]}" == "work" ]]; then
            echo "%{F#ff5770} %{F-}[${work_count}/${loop_num}] %{F#f39c12}${line[0]} %{F#27ae60}${line[1]}%{F-}"
            if [[ "${line[1]}" == "0s" ]]; then
                work_count=$(( "$work_count" % "$loop_num" + 1 ))
            fi
            echo $work_count
        elif [[ "${line[0]}" == "rest" ]]; then
            echo "%{F#7f8c8d} %{F-}[${rest_count}/${loop_num}] %{F#f39c12}${line[0]} %{F#27ae60}${line[1]}%{F-}"
            if [[ "${line[1]}" == "0s" ]]; then
                rest_count=$(( "$rest_count" % "$loop_num" + 1 ))
            fi
            echo $rest_count
        else
            echo Error!
        fi
    done < <(uair)
done
