#!/bin/sh
#PBS -l nodes=1:ppn=1

touch ligs.dict
touch ligs.pdbqt
j=1
for f in `cat test.list`
do
    echo $f
    name=`basename $f .pdbqt`
    echo MODEL $name >> ligs.pdbqt
    cat $f >> ligs.pdbqt
    echo ENDMDL >> ligs.pdbqt
    echo LIGAND $j	$name >> ligs.dict
    j=$[$j+1]
done
