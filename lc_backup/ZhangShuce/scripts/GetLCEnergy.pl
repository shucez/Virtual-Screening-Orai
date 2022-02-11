#!/usr/bin/perl -w
#use biolearning;
my $input;
my $output;
my $dict;
ReadPar(\$input, \$output, \$dict);
#print "input=$input\n";
#print "output=$output\n";
#print "dict=$dict\n";

my %namelist;
ReadDict(\$dict, \%namelist);
#foreach $j (keys (%namelist))
#{
#	print "$j\t$namelist{$j}\n";
#}
unless (open (OUTFILE,'>', "$output"))
{
	die "Cannot open dict file $!\n";
}
ReadFile(\$input, \%namelist);
#for ($i = 0; $i <= $num - 1; $i ++)
#{
# my @energy; 
# $energy[$i] = ReadFile($ARGV[$i]);
# print "$ARGV[$i]\t$energy[$i]\t";
#}
#print"\n";
close OUTFILE;


sub ReadPar
{
	if($#ARGV<5)
 	{
		die  "input files need to be specified\nUsage:\nperl GetLCEnegy.pl --input <file> --output <file>  --dict <file>\n--input <.pdbqt vinalc output>\n--output <output table file name>\n--dict <ligand dictionary generated by Gen>\n";
	}
	while ($#ARGV>=0)
	{
 		if ($ARGV[0] eq "--input")
 		{
   			shift(@ARGV);
   			${$_[0]}=$ARGV[0];
   			shift(@ARGV);
 		}
 		elsif ($ARGV[0] eq "--output")
 		{   
   			shift(@ARGV);
   			${$_[1]}=$ARGV[0];
   			shift(@ARGV);
 		}
 		elsif ($ARGV[0] eq "--dict")
 		{   
   			shift(@ARGV);
   			${$_[2]}=$ARGV[0];
   			shift(@ARGV);
 		}
                else {die "unrecognized parameter!\n";}
	}
}
sub ReadDict
{
	unless (open (DICTFILE, "${$_[0]}"))
	{
		die "Cannot open dict file ${$_[0]}\n";
	}
	while ($line = <DICTFILE>)
	{
		chomp($line);
		if ($line =~ /\b(LIGAND\s*\d*)\s*(\S*)\b/)
		{
			${$_[1]}{"$1"} = "$2";
		}
	}
}
sub ReadFile
{
	$backup = $/;
#	local $/ = "REMARK RECEPTOR";
	local $/ = "ENDMDL\n";
   	unless (open(INFILE,"${$_[0]}"))
    	{
      		die "Can't open the file:$!\n";
    	}
   	while ($para = <INFILE>)
    	{
#      print "$line\n";
      		chomp($para);
 #     print "$para\n\n\n\naaaaaa\n";
      		if ($para =~ /REMARK RECEPTOR\s*(.*pdbqt)/)
       		{
         		$geo = $1;
       		}
      		if ($para =~ /REMARK LIGAND\s*(LIGAND\s*\d*)/)
       		{
         		$lig = $1;
       		}
      		if ($para =~ /REMARK VINA RESULT:\s*(-?\d*.\d*)\s*0.000\s*0.000/)
       		{
         		$ene = $1;
       		}else
		{
			next;
		}
		print OUTFILE "$geo\t$namelist{$lig}\t$lig\t$ene\n";
    }
	local $/ = $backup;
}
