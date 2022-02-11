for ((f=0; f <= 75; f++))
 do
  cp Origin.csh PrepLigands$f.csh
  sed -i "s/\$1/$f/g" PrepLigands$f.csh
done
