#for ((j=0; j <= 75; j++))
#do
#qsub Ligands$j.csh
#done

for ((f=6; f <= 11; f++))
do
qsub Ligands8$f.csh
done
