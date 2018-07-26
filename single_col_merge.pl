use strict;
use warnings;

 
my $filename = 'ScandWolf_MHC_classII_cov_merged.txt';


open OUTPUT, '>ScandWolf_MHC_classII_cov_merged_single_col.txt';

if (open(my $fh, '<:encoding(UTF-8)', $filename)) {

    
    my $wolf="";
	my @cov;
	my $cov_ref = \@cov;

while (my $row = <$fh>) {
    chomp $row;
    
	my @data = split(/\t/,$row);
    my $data_ref = \@data;
    my $data3 = $data_ref->[3];
    my $data2 = $data_ref->[2];
#print STDOUT "$data3 and $wolf $data2 \n";
	my @name = split(/\./,$data3);
	my $name_ref = \@name;
	my $name_0 = $name_ref->[0];
#print STDOUT "$name_0\n";
	
	if ($data3 ne $wolf) {
        print OUTPUT "@$cov_ref\n";
		$wolf = $data3;
		push @cov, $name_ref->[0];
		print STDOUT "this when not equal @$cov_ref and wolf is $wolf\n";
	 } else {
			push @cov, $data2 ;
#print STDOUT "@$cov_ref\n";
	 	}
  }
} else {
  warn "Could not open file '$filename' $!";
}

