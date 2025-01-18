#!\usr\bin\perl -w 
use strict; 
 
##User INPUT
print("\n Enter the string :");                 
$x= <STDIN>;
chomp($x);                                     
#length of the string   
$length = length($x);                           
   
   for($i=1; $i<=$length; $i++)
   { 
     #subtrings of substrings    
     for($j=0; $j<= ($length - $i); $j++)                 
     {
      $y[$j]= substr($x, $j, $i);
     }

     for($l=0; $l<= ($length - $i); $l++)
     {
      $count = 0;
       for($m = $l +1; $m<= ($length- $i); $m++)
        {
           #pattern matching
           if($y[$l] =~/$y[$m]/)                                
          {
           $count++;
          }
       else{}
        } 
     if($count == 0)
     {
      print("\n $y[$l] ");
      $count1++;
     }
     else{}
      }
    }
print("\n \n Total number of DISTINCT substrings are :  $count1\n ");
 <STDIN>;
