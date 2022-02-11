#for ((j=65; j <= 75; j++))
#do
#qsub PrepLigands$j.csh
#done

for ((f=0; f <= 11; f++))
do
qsub PrepLigands8$f.csh
done
