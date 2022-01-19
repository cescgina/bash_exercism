#!/usr/bin/env bash

#input=$'T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR'
#input=$'A\n1'
input=$( cat <<END
The fourth line.
The fifth line.
END
)
expected=$( cat <<END
TT
hh
ee

ff
oi
uf
rt
th
h
 l
li
in
ne
e.
.
END
)
#echo "$expected" > ans.txt
./transpose.sh <<< "$input"
