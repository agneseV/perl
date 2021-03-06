#!usr/bin/perl
#This script reads in file "out.diff.sites_in_files", generated by vcftools --diff-site option and outputs a file with all common SNP positions as vcf-positions compatible 

use strict;
use warnings;

open (FH, '<', $ARGV[0]) or die "Can't open $ARGV[0]: $!\n"; #vcf file
open (FH2, '>', $ARGV[1]) or die "Can't open $ARGV[1]: $!\n"; # output file


while (<FH>) {
	chomp $_;
	my @data = split(/\t/,$_);
	if ($data[1] eq  $data[2]){
		print FH2 "$data[0]\t$data[1]\n";
    	}
    }

