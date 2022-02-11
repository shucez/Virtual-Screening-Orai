#!/bin/sh
#PBS -l nodes=1:ppn=24
mkdir -p ~/ZhangShuce/LCDocking/ETON/ETON$1_$2
cd ~/ZhangShuce/LCDocking/ETON/ETON$1_$2
cp ~/VS/etcLC/lig/Lig$1_$2.txt .
ln -s ~/VS/LigandsLC/Ligands$1/Lig$1_$2.* .
cp ../*.pdbqt .
cp ../*.txt .
mpirun -np 24 vinalc --recList ETON_rec.txt --geoList ETON_geo.txt --ligList Lig$1_$2.txt
