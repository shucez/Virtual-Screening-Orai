#!/bin/sh
#for ((j=8; j <= 13; j++))
#do
#for ((f=0; f <= 11; f++))
# do
#  qsub ./scripts_ETON/C_ETON"8$f"_"$j".sh
#done
#done
for ((f=35; f <= 75; f++))
 do
  qsub ./scripts_ETON/C_ETON"$f"_0.sh
done
for ((j=1; j <= 4; j++))
do
for ((f=0; f <= 75; f++))
 do
  qsub ./scripts_ETON/C_ETON"$f"_"$j".sh
done
done
for ((j=6; j <= 13; j++))
do
for ((f=0; f <= 75; f++))
 do
  qsub ./scripts_ETON/C_ETON"$f"_"$j".sh
done
done
