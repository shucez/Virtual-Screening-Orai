#!/bin/bash
for f in `cat list.txt`
do
echo "processing $f"
awk '($1 == "A" && $4 <= -8.1) || ($1 == "C" && $4 <= -9.4) || ($1 == "E" && $4 <= -8.1)' ./all/$f > ./filter_5/ACE_$f
awk '($1 == "A" && $4 <= -7.7) || ($1 == "C" && $4 <= -8.9) || ($1 == "E" && $4 <= -7.7)' ./all/$f > ./filter_4/ACE_$f
awk '($1 == "A" && $4 <= -7.3) || ($1 == "C" && $4 <= -8.4) || ($1 == "E" && $4 <= -7.3)' ./all/$f > ./filter_3/ACE_$f
awk '($1 == "A" && $4 <= -6.8) || ($1 == "C" && $4 <= -7.9) || ($1 == "E" && $4 <= -6.8)' ./all/$f > ./filter_2/ACE_$f

awk '($1 == "B" && $4 <= -9.5) || ($1 == "D" && $4 <= -8.9) || ($1 == "F" && $4 <= -8.5)' ./all/$f > ./filter_5/BDF_$f
awk '($1 == "B" && $4 <= -9.0) || ($1 == "D" && $4 <= -8.4) || ($1 == "F" && $4 <= -8.1)' ./all/$f > ./filter_4/BDF_$f
awk '($1 == "B" && $4 <= -8.3) || ($1 == "D" && $4 <= -7.8) || ($1 == "F" && $4 <= -7.6)' ./all/$f > ./filter_3/BDF_$f
awk '($1 == "B" && $4 <= -7.6) || ($1 == "D" && $4 <= -7.1) || ($1 == "F" && $4 <= -7.0)' ./all/$f > ./filter_2/BDF_$f

done
