for ((j=0; j <= 9; j++))
do
for ((f=0; f <= 11; f++))
 do
  cp Origin_GenLig.csh ./scripts_GenLig/GenLig"8$f"_"$j".csh
  sed -i "s/\$1/8$f/g" ./scripts_GenLig/GenLig"8$f"_"$j".csh
  sed -i "s/\$2/0$j/g" ./scripts_GenLig/GenLig"8$f"_"$j".csh
done
done
for ((j=10; j <= 13; j++))
do
for ((f=0; f <= 11; f++))
 do
  cp Origin_GenLig.csh ./scripts_GenLig/GenLig"8$f"_"$j".csh
  sed -i "s/\$1/8$f/g" ./scripts_GenLig/GenLig"8$f"_"$j".csh
  sed -i "s/\$2/$j/g" ./scripts_GenLig/GenLig"8$f"_"$j".csh
done
done
for ((j=0; j <= 9; j++))
do
for ((f=0; f <= 75; f++))
 do
  cp Origin_GenLig.csh ./scripts_GenLig/GenLig"$f"_"$j".csh
  sed -i "s/\$1/$f/g" ./scripts_GenLig/GenLig"$f"_"$j".csh
  sed -i "s/\$2/0$j/g" ./scripts_GenLig/GenLig"$f"_"$j".csh
done
done
for ((j=10; j <= 13; j++))
do
for ((f=0; f <= 75; f++))
 do
  cp Origin_GenLig.csh ./scripts_GenLig/GenLig"$f"_"$j".csh
  sed -i "s/\$1/$f/g" ./scripts_GenLig/GenLig"$f"_"$j".csh
  sed -i "s/\$2/$j/g" ./scripts_GenLig/GenLig"$f"_"$j".csh
done
done
