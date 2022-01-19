#!/usr/bin/env bash

factor_3=$(($1 % 3))
factor_5=$(($1 % 5))
factor_7=$(($1 % 7))
result=""
if [ $factor_3 == 0 ]; then
    result="Pling"
fi
if [ $factor_5 == 0 ]; then
    result="${result}Plang"
fi
if [ $factor_7 == 0 ]; then
    result="${result}Plong"
fi
if [ -z $result ]; then
    result=$1
fi
echo $result
