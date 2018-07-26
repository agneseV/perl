#!usr/bin/perl
#This script reads in .maf file from lastz alignment and converts it to a bed file with coordinates of the aligned sequences 

use strict;
use warnings;

open (FH, '<', $ARGV[0]) or die "Can't open $ARGV[0]: $!\n"; #vcf file
open (FH2, '>', $ARGV[1]) or die "Can't open $ARGV[1]: $!\n"; # output file



while (<FH>) {
	if ($_ =~ /^s/ && $_ =~ /\+/){
		#print STDOUT $_;
		chomp $_;
		my @data = split(/[\ \t]/,$_);
		my $end=$data[2]+$data[3];
		my $start=$data[2];
		print FH2 "$data[1]\t$start\t$end\n";
    	}
    elsif ($_ =~ /^s/ && $_ =~ /\-/){
		chomp $_;
		my @data = split(/[\ \t]/,$_);
		my $end=$data[5]-$data[2];
		my $start=$data[5]-$data[2]-$data[3];
		print FH2 "$data[1]\t$start\t$end\n";
    	}
    }

