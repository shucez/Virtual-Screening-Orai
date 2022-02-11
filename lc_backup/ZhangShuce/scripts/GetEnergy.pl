#!/usr/bin/perl -w
#use biolearning;
my $num=@ARGV;
if($num<1)
{
   die  "$0 require input file\n";
}
my $InFile = $ARGV[0];
#print "begin\n";
#print "$ARGV[0]\n";
#print "$ARGV[1]\n";
my $energy = ReadFile($ARGV[0]);
print"$ARGV[0]\t$energy\n";
sub ReadFile
{
   unless (open(INFILE,"$InFile"))
    {
      die "Can't opne the file:$!\n";
    }
   while ($line = <INFILE>)
    {
#      print "$line\n";
      chomp($line);
#      print "$line\n";
      if ($line =~ /\bREMARK VINA RESULT:\s*(-\d*.\d*)\s*0.000\s*0.000/)
       {
#         print "yes for ZINC\n";
#         print "$1\n\n\n";
         return($1);
       }
    }
}

