for ((j=$1; j <= $2; j++))
do
for ((f=$3; f <= $4; f++))
do
	echo "processing ETON_rec.txt_Lig8"$f"_"$j".txt.pdbqt.gz"
	cp ~/ZhangShuce/LCDocking/ETON/ETON8"$f"_"$j"/ETON_rec.txt_Lig8"$f"_"$j".txt.pdbqt.gz .
	gunzip ETON_rec.txt_Lig8"$f"_"$j".txt.pdbqt.gz
	~/ZhangShuce/scripts/GetLCEnergy.pl --input ETON_rec.txt_Lig8"$f"_"$j".txt.pdbqt --output R_ETON8"$f"_"$j".txt --dict ~/VS/LigandsLC/Ligands8"$f"/Lig8"$f"_"$j".dict
done
done



#for ((j=$1; j <= $2; j++))
#do
#for ((f=$3; f <= $4; f++))
#do
#	cp ~/ZhangShuce/LCDocking/ETON/ETON"$f"_"$j"/ETON_rec.txt_Lig"$f"_"$j".txt.pdbqt.gz .
#	gunzip ETON_rec.txt_Lig"$f"_"$j".txt.pdbqt.gz
#	~/ZhangShuce/scripts/GetLCEnergy.pl --input ETON_rec.txt_Lig"$f"_"$j".txt.pdbqt --output R_ETON"$f"_"$j".txt --dict ~/VS/LigandsLC/Ligands"$f"/Lig"$f"_"$j".dict
#done
#done
