#!/usr/bin/perl

#Get MetaData from a file using an identical IDs (both on their first column)

my $na = scalar @ARGV;

if ($na <= 1 or $na >=3 ){
	print "\n\usage:\n getDescription.pl <description tab delimited file> <List of IDs to copy Data from description file file> \n\n";
	exit 0;
}

my $description = shift;
my $fileIds = shift;
my %data;


open(Desc,"< $description") or die "cannot open $description";
open(File,"< $fileIds") or die "cannot open $fileIds";


while (<Desc>){
	chomp;
	$line =$_;
	@campos = split(/\t/,$line);
	$data{$campos[0]} = $line;
}

open (OUT, "> $fileIds"."_data_added.txt") or die "cannot create a output file";


while (<File>){
	chomp;
	$identifier= $_;
	print "--->(".$identifier.")";
	print OUT $identifier."\t".$data{$identifier}."\n";
	
}

close(Desc);
close(File);
close(OUT);
