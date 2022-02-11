#!/bin/csh
#PBS -l nodes=1:ppn=1
# $Id: Zhangsc/scripts/PrepLigands/Origin2.csh, Shuce 2016/03/31
#This script funtions to use 'prepare_ligands.py' python script to create
#.pdbqt files from .mol2 formatted individual molecules.
#Note: This script is to be execute only after processing by Edit_script.sh

cd ~/Zhangsc/VS/Ligands/Ligands$1
foreach f (`find . -name "*.mol2" -print`)
    echo $f
   /export1/home/zhangshuce/Zhangsc/autodock/mgltools_x86_64Linux2_1.5.6/bin/pythonsh ~/Zhangsc/prepare_ligand4.py -l $f  -d ~/Zhangsc/VS/etc/ligand_dict.py
    end
find . -name "*.pdbqt" -print > ~/Zhangsc/VS/etc/etc$1/test.list
