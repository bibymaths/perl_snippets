#!usr\bin\perl -w 
 
 use strict; 
  
my @testValues = (0, 1, 2, 3, 4, 5, 6, 10, 20, 30, 35);

foreach ( @testValues )  
{
   print "fibonacci( $_ ) = ", fibonacci( $_ ), "\n";
}

sub fibonacci
{ 
    # get the first argument
   my $number = shift; 

   if ( $number == 0 or $number == 1 )  
   {  
      # base case
      return $number;
   } 

   else  
   {                                 
      # recursive step
      return fibonacci( $number - 1 ) + fibonacci( $number - 2 );
   }
} 
