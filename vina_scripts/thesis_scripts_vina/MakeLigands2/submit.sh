#!/bin/sh
# $Id: Zhangsc/scripts/MakeLigands2/submit.csh, Shuce 2016/04/01
#This script is to submit jobs spliting .mol2 file

for ((j=0; j <= 75; j++))
do
qsub Ligands$j.csh
done

for ((f=0; f <= 11; f++))
do
qsub Ligands8$f.csh
done
