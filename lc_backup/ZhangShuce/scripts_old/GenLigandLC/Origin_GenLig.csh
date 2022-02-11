#!/bin/csh
#PBS -l nodes=1:ppn=1
# $Id: ex08.csh,v 1.6 2007/07/19 21:53:32 rhuey Exp $
#


# Create the ``Dockings`` directory::
cd ~/Zhangsc/VS
mkdir -p LigandsLC/Ligands$1
cd Ligands/Ligands$1

# Create a subdirectory named ``<ligand>_Orai`` and populate it
# with the docking input files: a) the ``pdbqt`` from the ``Ligands``
# directory will be copied directly; b) the maps will be lined to
# the ``Receptor`` directory; and, c) the ``dpf`` file will be created
# using ``prepare_dpf4.py``

bash ~/Zhangsc/GenLigList2.bash ~/Zhangsc/VS/etc/etc$1/docking/testlist$2 ~/Zhangsc/VS/LigandsLC/Ligands$1/Lig$1_$2.pdbqt ~/Zhangsc/VS/LigandsLC/Ligands$1/Lig$1_$2.dict    
