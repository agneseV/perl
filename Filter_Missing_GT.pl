#!usr/bin/perl
#This script removes all sites where at least one individual has a missing genotype ./.

use strict;
use warnings;

open (FH, '<', $ARGV[0]) or die "Can't open $ARGV[0]: $!\n"; #vcf file
open (FH2, '>', $ARGV[1]) or die "Can't open $ARGV[1]: $!\n"; # output file


while (<FH>) {

	if ($_ =~ /^#/ || $_ !~ /\.\/\./) {
		print FH2 $_;
    	}
    }

