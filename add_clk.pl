Perl
====

Perl Code to Automatically Generate Test Vectors


#! usr/bin/perl

$file = $ARGV[0]; 
@file_name = split(/\.in/, $ARGV[0]);
$file1 = "$file_name[0]"."in";
open(IN, "$file") or die("couldn't open the file");
open(OUT,">$file1") or die("couldn't open the file");
while($line = <IN>){
  if(($line =~ /\`(\w+)\s*\(\s*(\w+)\s*\,\s*(\w+)\s*\)\;/) or ($line =~ /\`(\w+)\s*\(\s*(\w+)\s*\)\;/)){
		$first  = $1;
		$second = $2;
		$third  = $3;
		if(($first == $pre_first) && ($second == $pre_second) && ($third == $pre_third)){
			#print "$first  = $pre_first\n";
			#print "$second = $pre_second\n";
			#print "$third  = $pre_third\n";
			print "`CLK(5);\n";	
			print "$line";
		}else{
			print "$line";
		} 
		$pre_first  = $first;
		$pre_second = $second;
		$pre_third  = $third;
	}
}	
