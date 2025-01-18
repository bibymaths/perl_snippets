#!usr\bin\perl  
  
use warnings;
use strict;

my $numdisks = 0;
 
##User Input 
print "Number of disks? \n";
chomp( $numdisks = <STDIN> );
 
##Calling the subroutine
print "The moves are:\n\n";
hanoi( $numdisks, 'A', 'B', 'C' );

sub hanoi {

  my( $num, $from, $to, $aux ) = @_;
    
  ##Conditional Statements for the moves: from, to, aux.
  if( $num == 1 )  
  {
    print "Move disk $num from $from to $to\n";
  }

  else  
  {
    hanoi( $num-1, $from, $aux, $to );
    print "Move disk $num from $from to $to\n";
    hanoi( $num-1, $aux, $to, $from );
  }
} 
 
  