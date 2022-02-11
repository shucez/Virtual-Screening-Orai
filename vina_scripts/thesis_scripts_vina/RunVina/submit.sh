#!/bin/sh
# $Id: Zhangsc/scripts/RunVina/submit.csh, Shuce 2016/04/05
#This script is to submit jobs running Vina
for ((j=0; j <= 75; j++))
do
qsub ./scripts_dOraiMCBDtri/C_dMCBDtri"$j"_6.csh
done
for ((j=0; j <= 11; j++))
do
qsub ./scripts_dOraiMCBDtri/C_dMCBDtri8"$j"_6.csh
done
