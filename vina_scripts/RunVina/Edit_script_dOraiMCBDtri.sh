#!/bin/sh
# $Id: Zhangsc/scripts/RunVina/Edit_script.csh, Shuce 2016/04/05
#This script is to generate parallel scripts for
#docking parallelly with Vina

for ((j=0; j <= 9; j++))
do
for ((f=0; f <= 11; f++))
 do
  cp Origin_dOraiMCBDtri.csh ./scripts_dOraiMCBDtri/C_dMCBDtri"8$f"_"$j".csh
  sed -i "s/\$1/8$f/g" ./scripts_dOraiMCBDtri/C_dMCBDtri"8$f"_"$j".csh
  sed -i "s/\$2/0$j/g" ./scripts_dOraiMCBDtri/C_dMCBDtri"8$f"_"$j".csh
done
done
for ((j=10; j <= 13; j++))
do
for ((f=0; f <= 11; f++))
 do
  cp Origin_dOraiMCBDtri.csh ./scripts_dOraiMCBDtri/C_dMCBDtri"8$f"_"$j".csh
  sed -i "s/\$1/8$f/g" ./scripts_dOraiMCBDtri/C_dMCBDtri"8$f"_"$j".csh
  sed -i "s/\$2/$j/g" ./scripts_dOraiMCBDtri/C_dMCBDtri"8$f"_"$j".csh
done
done
for ((j=0; j <= 9; j++))
do
for ((f=0; f <= 75; f++))
 do
  cp Origin_dOraiMCBDtri.csh ./scripts_dOraiMCBDtri/C_dMCBDtri"$f"_"$j".csh
  sed -i "s/\$1/$f/g" ./scripts_dOraiMCBDtri/C_dMCBDtri"$f"_"$j".csh
  sed -i "s/\$2/0$j/g" ./scripts_dOraiMCBDtri/C_dMCBDtri"$f"_"$j".csh
done
done
for ((j=10; j <= 13; j++))
do
for ((f=0; f <= 75; f++))
 do
  cp Origin_dOraiMCBDtri.csh ./scripts_dOraiMCBDtri/C_dMCBDtri"$f"_"$j".csh
  sed -i "s/\$1/$f/g" ./scripts_dOraiMCBDtri/C_dMCBDtri"$f"_"$j".csh
  sed -i "s/\$2/$j/g" ./scripts_dOraiMCBDtri/C_dMCBDtri"$f"_"$j".csh
done
done
