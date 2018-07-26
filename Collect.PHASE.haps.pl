#!usr/bin/perl
#Agnese 10.05.2018
#This script reads in set of PHASE.out files and extracts all best gess haplotypes for each individual in to a single file
#Used after running PHASE on the same data set with 5 different seeds for comparison reasons. 

use strict;
use warnings;

my @FILES = <"$ARGV[0]">; #file path and pattern matching, ex: /proj/sllstore2017034/nobackup/work/agnese/Scand_wolf/SNVs/ENTIRE_MHC/Scand_wolf.chr.12.1.10000000.filtered.thin10000.pop1.*.1000.out
open (FH2, '>', $ARGV[1]) or die "Can't open $ARGV[1]: $!\n";

foreach my $file (@FILES) {
	print FH2 "$file\n";
	open (FH, '<', $file ) or die "Can't open $ARGV[0]: $!\n";
	while (<FH>) {
	my @data=();
		if ($_ =~/^0 #/){
        		#print STDOUT $_;
        		chomp $_;
        		@data = split(/#/,$_);
        		#print STDOUT "@data";
			my $hap1 = <FH>;
        		my $hap2 = <FH>;
        		print FH2 "$data[1] $hap1$data[1] $hap2";
        }
    }

}

