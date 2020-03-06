#!/usr/bin/env bash
# Originally from: https://www.daveeddy.com/2014/06/29/human-readable-duration-in-bash/
human() {
    local seconds=$1
    if ((seconds < 0)); then
        ((seconds *= -1))
    fi

    local times=(
    $((seconds / 60 / 60 / 24 / 365)) # years
    $((seconds / 60 / 60 / 24 / 30))  # months
    $((seconds / 60 / 60 / 24 / 7))   # weeks
    $((seconds / 60 / 60 / 24))       # days
    $((seconds / 60 / 60))            # hours
    $((seconds / 60))                 # minutes
    $((seconds))                      # seconds
    )
    local names=(year month week day hour minute second)

    local i
    for ((i = 0; i < ${#names[@]}; i++)); do
        if ((${times[$i]} > 1)); then
            echo "${times[$i]} ${names[$i]}s"
            return
        elif ((${times[$i]} == 1)); then
            echo "${times[$i]} ${names[$i]}"
            return
        fi
    done
    echo '0 seconds'
}
