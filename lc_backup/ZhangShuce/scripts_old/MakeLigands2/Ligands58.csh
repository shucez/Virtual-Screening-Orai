#!/bin/csh
#PBS -l nodes=1:ppn=1
# Create the directory in which all your Virtual Screening Tutorial
# activities will take  place:
cd ~/Zhangsc/VS
#mkdir ~/Zhangsc/VS/etc58
mkdir ~/Zhangsc/VS/Ligands/Ligands58

# make the Ligands directory the current working directory
cd ~/Zhangsc/VS/Ligands/Ligands58
#mkdir test
#cd test
# use the UNIX utility csplit to divide the multi-molecule mol2
# file into separate files
#cp $VSTROOT/VS/Ligands/test.mol2 $VSTROOT/VS/Ligands/test/test.mol2
cat ~/Zhangsc/VS/Ligands/23_p0.58.mol2 | csplit -ftmp -n4 -ks - '%^@.TRIPOS.MOLECULE%' '/^@.TRIPOS.MOLECULE/' '{*}'

# Rename the tmp file according to ZINC identifier
# Here the outline of how we do this:
#    1. extract ZINCn8 from the tmpNNNN file and set to variable
#    2. if the Zn8.mol2 file does not exist, the rename the tmpNNNN file

foreach f (tmp*)
echo $f
set zid = `grep ZINC $f`
if !(-e "$zid".mol2) then
set filename = "$zid".mol2
else foreach n (`seq -w 1 99`)
if !(-e "$zid"_"$n".mol2) then
set filename = "$zid"_"$n".mol2
break
endif
end
endif
mv -v $f $filename
end

# Copy positive control 'ind.pdb' into 'Ligands'
#cp ~/Zhangsc/ind.pdb .

# Create the list of Ligands and
# find ./*.mol2  > ~/Zhangsc/VS/etc/ligand.list


