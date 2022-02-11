#!/bin/sh
# $Id: Zhangsc/scripts/PrepLigands/submit.csh, Shuce 2016/03/31
#This script is to submit jobs converting .mol2 to .pdbqt

for ((j=0; j <= 75; j++))
do
	qsub PrepLigands$j.csh
done

for ((f=0; f <= 11; f++))
do
	qsub PrepLigands8$f.csh
done
