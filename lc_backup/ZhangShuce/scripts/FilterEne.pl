#!/usr/bin/perl -w
#use biolearning;
my $num=@ARGV;
if($num<2)
{
   die  "$0 requires an input file and a threshold.\n";
}
#for ($i = 0; $i <= $num - 1; $i ++)
#{
# my @energy; 
# $energy[$i] = ReadFile($ARGV[$i]);
# print "$ARGV[$i]\t$energy[$i]\t";
#}
print"This is the filtered result from $ARGV[0] with the threshold of $ARGV[1] kcal/mol.\n";
ReadFile($ARGV[0], $ARGV[1]);
sub ReadFile
{
   my $InFile = shift;
   my $threshold = shift;
   unless (open(INFILE,"$InFile"))
    {
      die "Can't opne the file:$! $InFile\n";
    }
   while ($line = <INFILE>)
    {
#      print "$line\n";
      chomp($line);
#      print "$line\n";
      if ($line =~ /\b(ZINC\d*).*\.pdbqt\s*(-\d*.\d*)\s*ZINC.*\.pdbqt\s*(-\d*.\d*)\sZINC.*\.pdbqt\s*(-\d*.\d*)/)
       {
         if ($2 <= $threshold && $3 <= $threshold && $4 <= $threshold)
          {
           print "$1\t$2\t$3\t$4\n";
          }
       }
    }
}

