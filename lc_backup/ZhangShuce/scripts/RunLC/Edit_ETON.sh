for ((j=0; j <= 13; j++))
do
for ((f=0; f <= 11; f++))
 do
  cp Origin_ETON.sh ./scripts_ETON/C_ETON"8$f"_"$j".sh
  sed -i "s/\$1/8$f/g" ./scripts_ETON/C_ETON"8$f"_"$j".sh
  sed -i "s/\$2/$j/g" ./scripts_ETON/C_ETON"8$f"_"$j".sh
done
done
for ((j=0; j <= 13; j++))
do
for ((f=0; f <= 75; f++))
 do
  cp Origin_ETON.sh ./scripts_ETON/C_ETON"$f"_"$j".sh
  sed -i "s/\$1/$f/g" ./scripts_ETON/C_ETON"$f"_"$j".sh
  sed -i "s/\$2/$j/g" ./scripts_ETON/C_ETON"$f"_"$j".sh
done
done
