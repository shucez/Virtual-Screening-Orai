#!/usr/bin/perl -w
# Shuce Zhang 18 Jan 2021
# Convert tranches from ZINC database to ligand lists in uniform length for VinaLC
# Accepts both *.pdbqt or *.pdbqt.gz
# Usage: perl ligands_pdbqt.pl --input_path <dir> --output_path <dir>  --size <int> 
# use PerlIO::gzip;
# use biolearning;
use List::Util qw(shuffle);
my $input;
my $output;
my $size;
ReadPar(\$input, \$output, \$size);


opendir my $indir, $input or die "Cannot open directory: $!";
my @rawfiles = readdir $indir;
closedir $indir;

print "input=$input\n";
print "output=$output\n";
print "size=$size\n";

@rawfiles = shuffle(@rawfiles); #shuffle the order of the tranches so that the different compounds are kind of mixed
print "files=@rawfiles\n";



my $i = 1;     # count for output files
my $j = 1;     # count for ligand number in that file

unless (open (SPLIT,'>', "$output/Ligands$i.pdbqt"))
{
	die "Cannot open dict file $!\n";
}

unless (open (DICT,'>', "$output/Ligands$i.dict"))
{
        die "Cannot open dict file $!\n";
}


$backup = $/;

foreach (@rawfiles)
{
	print "working on $_\n";
	if ($_ =~ /.pdbqt.gz$/)
	{
		# open(INFILE, '<:gzip', $_) or die "Cannot open directory: $!";
		# open(INFILE, '-|', 'gunzip', '-c', "$input/$_") or die "Cannot open file: $!";
		unless (open(INFILE, '-|', 'gunzip', '-c', "$input/$_"))
		{
			print "Cannot open file: $!";
			next;
		}
	}
	elsif ($_ =~ /.pdbqt$/)
	{
		# open(INFILE, $_) || die "can’t open file: $!";
		unless (open(INFILE, "$input/$_"))
		{
			print "Cannot open file: $!";
			next;
		}
	}
	else
	{
		next;
	}
	local $/ = "ENDMDL\n";
        while ($para = <INFILE>)
        {
		chomp($para);
		if ($para =~ /REMARK\s*Name.*(ZINC\d*)/)
                {
                        $ZINC = $1;
			# $j += 1;
                }
                $para =~ s/MODEL.*\d*/MODEL\t$j\t$ZINC/g;
                print SPLIT "$para\nENDMDL\n\n";
                print DICT "LIGAND $j $ZINC\n";
		$j += 1;
		if ($j > $size)
		{
			close SPLIT or die "Cannot close file: $!";
			close DICT or die "Cannot close file: $!";
			$i += 1;
			$j = 1;
			unless (open (SPLIT,'>', "$output/Ligands$i.pdbqt"))
			{
        			die "Cannot open dict file $!\n";
			}
			unless (open (DICT,'>', "$output/Ligands$i.dict"))
			{
        			die "Cannot open dict file $!\n";
			}
		}
	}
	#close INFILE or die "Cannot close file: $!";
	unless (close INFILE)
	{
		print "Cannot close file: $!";
		next;
	}
}



    local $/ = $backup;





sub ReadPar
{
	if($#ARGV<5)
 	{
		die  "input files need to be specified\nUsage:\nperl ligands_pdbqt.pl --input_path <dir> --output_path <dir>  --size <int>\n--input_path <directory of raw .pdbqt or .pdbqt.gz from ZINC>\n--output_path <output directory>\n--size <number of ligands in a chunk>\n";
	}
	while ($#ARGV>=0)
	{
 		if ($ARGV[0] eq "--input_path")
 		{
   			shift(@ARGV);
   			${$_[0]}=$ARGV[0];
   			shift(@ARGV);
 		}
 		elsif ($ARGV[0] eq "--output_path")
 		{   
   			shift(@ARGV);
   			${$_[1]}=$ARGV[0];
   			shift(@ARGV);
 		}
 		elsif ($ARGV[0] eq "--size")
 		{   
   			shift(@ARGV);
   			${$_[2]}=$ARGV[0];
   			shift(@ARGV);
 		}
                else {die "unrecognized parameter!\n";}
	}
}



