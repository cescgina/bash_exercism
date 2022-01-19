#!/usr/bin/bash

x=${1:-0}
y=${2:-0}
direction=${3:-north}
case $direction in
    "north")
        direction=0 ;;
    "east")
        direction=1 ;;
    "south")
        direction=2 ;;
    "west")
        direction=3;;
    *)
        echo "invalid direction"
        exit 1 ;;
esac
instructions=""

if [[ $# -eq 4 ]]; then
    instructions=$4
fi

for (( i=0; i<${#instructions}; i++ )); do
    move=${instructions:$i:1}
    if [[ "$move" = "R" ]]; then
        let direction++
        let direction%=4
    elif [[ "$move" = "L" ]]; then
        if [[ $direction == 0 ]]; then
            direction=3
        else
            let direction--
        fi
    elif [[ "$move" == "A" ]]; then
        case $direction in
            0)
                let y++ ;;
            1)
                let x++ ;;
            2)
                let y-- ;;
            3)
                let x-- ;;
        esac
    else
        echo "invalid instruction"
        exit 1
    fi
done
case $direction in
    0)
        direction="north" ;;
    1)
        direction="east" ;;
    2)
        direction="south" ;;
    3)
        direction="west" ;;
esac
echo "$x $y $direction"
