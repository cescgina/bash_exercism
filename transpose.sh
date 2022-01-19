#!/usr/bin/env bash

mapfile -t words
max_len=0
for word in "${words[@]}"; do
    if [[ ${#word} -gt max_len ]]; then
        max_len=${#word}
    fi
done

declare -a words_pad

#for word in "${words[@]}"; do
#    diff=$((max_len-${#word}))
#    pad="$(printf '%*s' $diff "")"
#    result="$word$pad"
#    words_pad+=( "$result" )
#done
index=0
while [[ $index -lt $max_len ]]; do
    line=""
    for word in "${words[@]}"; do
        letter="${word:$index:1}"
        line=$line${letter:-'#'}
    done
    echo $line
    #line=${line%%#}
    re='#$'
    while [[ $line =~ $re ]]; do
        line=${line%#}
    done
    echo "${line//#/ }"
    let index++
done
exit 0
