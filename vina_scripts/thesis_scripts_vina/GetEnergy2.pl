#!/usr/bin/perl -w
# $Id: Zhangsc/GetEnergy2.pl, Shuce 2016/07/06
#This script is to extract the best docking energy from the
#output file of Autodock Vina (pdbqt format).
#use biolearning;
my $num=@ARGV;
if($num<1)
{
   die  "$0 require input file\n";
}

for ($i = 0; $i <= $num - 1; $i ++)
{
 my @energy; 
 $energy[$i] = ReadFile($ARGV[$i]);
 print "$ARGV[$i]\t$energy[$i]\t";
}
print"\n";
sub ReadFile
{
   my $InFile = shift;
   unless (open(INFILE,"$InFile"))
    {
      die "Can't opne the file:$!\n";
    }
   while ($line = <INFILE>)
    {
#      print "$line\n";
      chomp($line);
#      print "$line\n";
      if ($line =~ /\bREMARK VINA RESULT:\s*(-?\d*.\d*)\s*0.000\s*0.000/)
       {
#         print "yes for ZINC\n";
#         print "$1\n\n\n";
         return($1);
       }
    }
}

