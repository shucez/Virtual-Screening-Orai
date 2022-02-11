#!/bin/csh
#PBS -l nodes=1:ppn=1
# $Id: Zhangsc/scripts/MakeLigands2/Origin.csh, Shuce 2016/04/01
#This script is to split .mol2 file from ZINC to single molecules.
#Note: This script is to be execute only after processing by Edit_script.sh

cd ~/Zhangsc/VS
mkdir ~/Zhangsc/VS/Ligands/Ligands$1
cd ~/Zhangsc/VS/Ligands/Ligands$1

#create tmp file to split the .mol set into individual compounds

cat ~/Zhangsc/VS/Ligands/23_p0.$1.mol2 | csplit -ftmp -n4 -ks - '%^@.TRIPOS.MOLECULE%' '/^@.TRIPOS.MOLECULE/' '{*}'

# Rename the tmp file according to ZINC identifier
# Here the outline of how we do this:
#    1. extract ZINCn8 from the tmpNNNN file and set to variable
#    2. if the Zn8.mol2 file does not exist, the rename the tmpNNNN file

foreach f (tmp*)
	echo $f
	set zid = `grep ZINC $f`
	if !(-e "$zid".mol2) then
		set filename = "$zid".mol2
	else 
		foreach n (`seq -w 1 99`)
			if !(-e "$zid"_"$n".mol2) then
					set filename = "$zid"_"$n".mol2
					break
			endif
		end
	endif
	mv -v $f $filename
end
