for ((f=0; f <= 11; f++))
 do
  cp Origin2.csh Ligands8$f.csh
  sed -i "s/\$1/$f/g" Ligands8$f.csh
done
