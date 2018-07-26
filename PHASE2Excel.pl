#!usr/bin/perl
#transforms PHASE output file to Excel friendly format

use strict;
use warnings;

open (FH, '<', $ARGV[0]) or die "Can't open $ARGV[0]: $!\n"; 
open (FH2, '>', $ARGV[1]) or die "Can't open $ARGV[1]: $!\n"; 

while (<FH>) {
	if ($_ =~/^0/){
	#print STDOUT $_;
	chomp $_;
	my @data = split(/#/,$_);
	my $hap1 = <FH>;
	my $hap2 = <FH>;
	print FH2 "$data[1] $hap1$data[1] $hap2";
    	}
    }

