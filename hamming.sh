#!/usr/bin/bash

declare -i distance=0

len1=${#1}
len2=${#2}

if [ "$#" -lt 2 ]; then
    echo "Usage: hamming.sh <string1> <string2>"
    exit 1
fi

if [ $len1 != $len2 ]; then
    echo "strands must be of equal length"
    exit 1
fi

for ind in $(seq 0 $(( ${#1}-1 )))
do
    letter1=${1:$ind:1}
    letter2=${2:$ind:1}
    if [ $letter1 != $letter2 ]; then
        distance=$distance+1
    fi
done

echo $distance
