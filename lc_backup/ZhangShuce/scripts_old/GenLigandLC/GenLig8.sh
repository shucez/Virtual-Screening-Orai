#!/bin/sh
#PBS -l nodes=1:ppn=1
# $Id: ex08.csh,v 1.6 2007/07/19 21:53:32 rhuey Exp $
#


# Create the ``Dockings`` directory::
cd ~/Zhangsc/VS

for ((f=8; f <= 11; f++))
do
	mkdir -p ~/Zhangsc/VS/LigandsLC/Ligands8$f
	cd ~/Zhangsc/VS/Ligands/Ligands8$f
        for ((j=0; j <= 9; j++))
        do
		bash ~/Zhangsc/GenLigList2.bash ~/Zhangsc/VS/etc/etc8$f/docking/testlist0$j ~/Zhangsc/VS/LigandsLC/Ligands8$f/Lig8"$f"_"$j".pdbqt ~/Zhangsc/VS/LigandsLC/Ligands8$f/Lig8"$f"_"$j".dict    
        done
        for ((j=10; j <= 13; j++))
        do
		bash ~/Zhangsc/GenLigList2.bash ~/Zhangsc/VS/etc/etc8$f/docking/testlist$j ~/Zhangsc/VS/LigandsLC/Ligands8$f/Lig8"$f"_"$j".pdbqt ~/Zhangsc/VS/LigandsLC/Ligands8$f/Lig8"$f"_"$j".dict    
        done
done

#for ((f=0; f <= 75; f++))
#do
#	mkdir -p ~/Zhangsc/VS/LigandsLC/Ligands$f
#	cd ~/Zhangsc/VS/Ligands/Ligands$f
#       for ((j=0; j <= 9; j++))
#       do
#		bash ~/Zhangsc/GenLigList2.bash ~/Zhangsc/VS/etc/etc$f/docking/testlist0$j ~/Zhangsc/VS/LigandsLC/Ligands$f/Lig"$f"_"$j".pdbqt ~/Zhangsc/VS/LigandsLC/Ligands$f/Lig"$f"_"$j".dict    
#       done
#       for ((j=10; j <= 13; j++))
#       do
#		bash ~/Zhangsc/GenLigList2.bash ~/Zhangsc/VS/etc/etc$f/docking/testlist$j ~/Zhangsc/VS/LigandsLC/Ligands$f/Lig"$f"_"$j".pdbqt ~/Zhangsc/VS/LigandsLC/Ligands$f/Lig"$f"_"$j".dict    
#       done
#done


