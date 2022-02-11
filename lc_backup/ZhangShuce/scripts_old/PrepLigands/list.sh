for (( j=0; j <= 11; j++ ))
do
cd ~/Zhangsc/VS/Ligands/Ligands8$j
mkdir -p ~/Zhangsc/VS/etc/etc8$j/
find . -name "*.pdbqt" -print > ~/Zhangsc/VS/etc/etc8$j/test.list
done
#for (( j=68; j <= 74; j++ ))
#do
#cd ~/Zhangsc/VS/Ligands/Ligands$j
#mkdir -p ~/Zhangsc/VS/etc/etc$j/
#find . -name "*.pdbqt" -print > ~/Zhangsc/VS/etc/etc$j/test.list
#done
