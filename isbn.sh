#!/bin/bash

if [[ "$#" -lt 1 ]]; then
    echo "Usage: `basename $0` isbn"
fi


isbn=${1//-/}

if [[ $isbn =~ [^0-9X] ]]; then
    echo "false"
    exit
fi

if [[ "${#isbn}" -ne 10 ]]; then
    echo "false"
    exit
fi

check=0
index=0
while [[ $index -lt 10 ]]; do
    mul=$(( 10-$index ))
    digit=${isbn:$index:1}
    if [[ "$digit" == X ]]; then
        if [[ $index -ne 9 ]]; then
            echo "false"
            exit
        fi
        digit=10
    fi
    let check+=$digit*$mul
    let index++
done

let check%=11
if [[ $check -eq 0 ]]; then 
    echo "true"
else
    echo "false"
fi
