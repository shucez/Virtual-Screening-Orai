for ((j=0; j <= 13; j++))
do
	for ((f=0; f <= 11; f++))
 	do
		qsub ./scripts_GenLig/GenLig8"$f"_"$j".csh
	done
	for ((f=0; f <= 75; f++))
 	do
		qsub ./scripts_GenLig/GenLig"$f"_"$j".csh
	done
done
