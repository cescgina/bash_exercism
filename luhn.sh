#!/usr/bin/bash

if [[ "$#" -lt 1 ]]; then
    echo "Usage: `basename $0` code"
    exit 1
fi

num=${1// /}
len=${#num}

if [[ $len -lt 2 ]]; then
    echo "false"
    exit
fi

if [[ $num =~ [^0-9] ]]; then
    echo "false"
    exit
fi

let ind=$len-1
check=0
double=0
while [[ $ind -ge 0 ]]
do
    digit=${num:$ind:1}
    if [[ double -eq 1 ]]; then
        let temp=digit*2
        if [[ $temp -gt 9 ]]; then
            let temp-=9
        fi
        let check+=temp
        double=0
    else
        let check+=$digit
        double=1
    fi
    let ind--
done

let check%=10
if [[ $check -eq 0 ]]; then 
    echo "true"
else
    echo "false"
fi
