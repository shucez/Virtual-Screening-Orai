for ((j=0; j <= 13; j++))
do
for ((f=0; f <= 11; f++))
 do
  qsub ./scripts_SOAR5K/C_SOAR5K"8$f"_"$j".sh
done
done
for ((j=0; j <= 13; j++))
do
for ((f=0; f <= 75; f++))
 do
  qsub ./scripts_SOAR5K/C_SOAR5K"$f"_"$j".sh
done
done
