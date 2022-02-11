for ((f=0; f <= 75; f++))
 do
  cp Origin.csh Ligands$f.csh
  sed -i "s/\$1/$f/g" Ligands$f.csh
done
