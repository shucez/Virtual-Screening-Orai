for ((f=0; f <= 11; f++))
 do
  cp Origin.csh PrepLigands8$f.csh
  sed -i "s/\$1/8$f/g" PrepLigands8$f.csh
done
