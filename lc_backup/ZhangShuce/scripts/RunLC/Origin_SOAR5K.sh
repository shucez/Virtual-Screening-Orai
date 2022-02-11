#!/bin/sh
#PBS -l nodes=2:ppn=5
mkdir -p ~/ZhangShuce/LCDocking/SOAR5K/SOAR5K$1_$2
cd ~/ZhangShuce/LCDocking/SOAR5K/SOAR5K$1_$2
cp ~/VS/etcLC/lig/Lig$1_$2.txt .
ln -s ~/VS/LigandsLC/Ligands$1/Lig$1_$2.* .
cp ../*.pdbqt .
cp ../*.txt .
mpirun -np 10 vinalc --recList SOAR5K_rec.txt --geoList SOAR5K_geo.txt --ligList Lig$1_$2.txt
