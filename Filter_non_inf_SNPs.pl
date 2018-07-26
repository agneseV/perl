#!usr/bin/perl
#This script keeps only those SNP sites, where at least one individual is heterozygous

use strict;
use warnings;

open (FH, '<', $ARGV[0]) or die "Can't open $ARGV[0]: $!\n"; #vcf file
open (FH2, '>', $ARGV[1]) or die "Can't open $ARGV[1]: $!\n"; # output file


while (<FH>) {
	if ($_ =~ /^#/ || $_ =~ /0\/1/ || $_ =~ /1\/0/){
		print FH2 $_;
    	}
    }

