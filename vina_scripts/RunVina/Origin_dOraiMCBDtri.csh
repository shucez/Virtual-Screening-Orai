#!/bin/csh
#PBS -l nodes=1:ppn=1
# $Id: Zhangsc/scripts/RunVina/Origin_dOraiMCBDtri.csh, Shuce 2016/04/05
#This script funtions to run Autodock Vina to dock a list of compounds against a 
#designated region of Receptor.
#Note: This script is to be execute only after processing by Edit_script.sh

# Create the ``Dockings`` and ``Results`` directory::
cd /export/panfs02/home/zhangshuce/Zhangsc/VS
mkdir -p Dockings/Dockings$1/dlgs$2
mkdir -p Results/Results$1/dlgs$2
cd Dockings/Dockings$1/dlgs$2

# Please Specify the designated docking region in the .para parameter file.

foreach f (`cat /export/panfs02/home/zhangshuce/Zhangsc/VS/etc/etc$1/docking/testlist$2`)
    set name = `basename $f .pdbqt`
    echo $name
    mkdir "$name"_dOraiM_CBD
    cd "$name"_dOraiM_CBD
    ln -s ~/Zhangsc/VS/Ligands/Ligands$1/"$f" .
    ln -s ~/Zhangsc/VS/Receptor/d_Orai1_Dong.pdbqt .
    ln -s ~/Zhangsc/VS/Receptor/dOraiM_CBD*.para .
    mkdir -p  /export/panfs02/home/zhangshuce/Zhangsc/VS/Results/Results$1/dlgs$2/"$name"_dOraiM_CBD
    ~/Zhangsc/autodock/autodock_vina_1_1_2_linux_x86/bin/vina --ligand "$f" --config dOraiM_CBD_AB.para --out "$name"_dOraiM_CBD_AB.pdbqt --log "$name"_dOraiM_CBD_AB.log
    ~/Zhangsc/autodock/autodock_vina_1_1_2_linux_x86/bin/vina --ligand "$f" --config dOraiM_CBD_CD.para --out "$name"_dOraiM_CBD_CD.pdbqt --log "$name"_dOraiM_CBD_CD.log
    ~/Zhangsc/autodock/autodock_vina_1_1_2_linux_x86/bin/vina --ligand "$f" --config dOraiM_CBD_EF.para --out "$name"_dOraiM_CBD_EF.pdbqt --log "$name"_dOraiM_CBD_EF.log
    perl ~/Zhangsc/GetEnergy2.pl "$name"_dOraiM_CBD_AB.pdbqt "$name"_dOraiM_CBD_CD.pdbqt "$name"_dOraiM_CBD_EF.pdbqt >> ~/Zhangsc/VS/Results/dOraiMCBD/raw$1_$2.ene
    mv ./"$name"_dOraiM_CBD* ~/Zhangsc/VS/Results/Results$1/dlgs$2/"$name"_dOraiM_CBD/
    cd ..
end
