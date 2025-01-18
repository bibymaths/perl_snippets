#!/usr/bin/perl -w
  
use strict;
 
##User INPUT 
print("\n Enter the strings in Upper Case (Case Sensitive) \n"); 
print("\n Enter the first sequence : "); 
chomp(my $s1 = <STDIN> ); 
print("\n Enter the second sequence : "); 
chomp(my $s2 = <STDIN> ); 
print("\n Enther the third sequence : ");  
chomp(my $s3 = <STDIN> );
 
##Passing variables to argument subroutine
hd($s1, $s2);                                                        
hd($s1, $s3); 

sub hd 
{
     
     my ($k,$l) = @_;                                                 
     my $len = length ($k);                                           
     my $mismatch = 0;

     for (my $i=0; $i<$len; $i++)
     {
      ++$mismatch if substr($k, $i, 1) ne substr($l, $i, 1);          
     }

     print ("\n\n The Hamming Distance between $k and $l is  $mismatch \n ");           
}
