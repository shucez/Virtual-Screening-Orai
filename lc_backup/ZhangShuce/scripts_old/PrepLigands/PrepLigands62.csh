#!/bin/csh
#PBS -l nodes=1:ppn=1
# $Id: ex02.csh,v 1.5 2007/07/19 21:52:59 rhuey Exp $
#

# use the 'prepare_ligands.py' python script to create pdbq files
cd ~/Zhangsc/VS/Ligands/Ligands62
foreach f (`find . -name "*.mol2" -print`)
    echo $f
   /export1/home/zhangshuce/Zhangsc/autodock/mgltools_x86_64Linux2_1.5.6/bin/pythonsh ~/Zhangsc/prepare_ligand4.py -l $f  -d ~/Zhangsc/VS/etc/ligand_dict.py
    end
find . -name "*.pdbqt" -print > ~/Zhangsc/VS/etc62/test.list
