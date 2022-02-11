#!/bin/sh
# $Id: Zhangsc/scripts/MakeLigands2/Edit_script.csh, Shuce 2016/03/31
#This script is to generate parallel scripts for
#spliting .mol2 file from ZINC

for ((f=0; f <= 75; f++))
 do
  cp Origin.csh Ligands$f.csh
  sed -i "s/\$1/$f/g" Ligands$f.csh
done

for ((f=0; f <= 11; f++))
 do
  cp Origin2.csh Ligands8$f.csh
  sed -i "s/\$1/$f/g" Ligands8$f.csh
done

