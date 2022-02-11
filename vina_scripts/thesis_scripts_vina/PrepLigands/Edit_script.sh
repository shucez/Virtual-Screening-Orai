#!/bin/sh
# $Id: Zhangsc/scripts/PrepLigands/Edit_script.csh, Shuce 2016/03/31
#This script is to generate parallel scripts for
#converting single molecular .mol2 file into .pdbqt

for ((f=0; f <= 75; f++))
do
	cp Origin.csh PrepLigands$f.csh
	sed -i "s/\$1/$f/g" PrepLigands$f.csh
done

for ((f=0; f <= 11; f++))
do
	cp Origin.csh PrepLigands8$f.csh
	sed -i "s/\$1/8$f/g" PrepLigands8$f.csh
done

