use strict;
use warnings;
use diagnostics;
open (F1,"protein.txt");
my $sequence='';
my $flag=0;
my $x;
my $i;
my %freq;
my $rc;
my $phobic;

while(($x=<F1>))
{ 
 if($flag eq 0)
  {
   $flag=1;
  }
else 
{
 chomp $x;
$sequence=$sequence.$x;
}
}
my $l=length($sequence);
print "Sequence is : $sequence";
print "\n length of sequence $l";
my @sequence=split('',$sequence);
for($i=0;$i<$l;$i++)
{
 $freq{$sequence[$i]}=$freq{$sequence[$i]}+1;
}  
foreach $x(keys %freq)
{
 print "\n".$x." ".$freq{$x};
} 
 
foreach$x(keys %freq)
{
 print "\npercentage of ".$x." ".((($freq{$x})/$l)*100);
} 

#my $i=0;
#my @phobic = ('a','i','l','m','f','p','w','v');
$x = "A";
my $ca = () = $sequence =~ /$x/g; 
print "\n A $ca.";

$x = "I";
my $ci = () = $sequence =~ /$x/g; 
print " I $ci.";

$x = "L";
my $cl = () = $sequence =~ /$x/g; 
print " L $cl.";

$x = "M";
my $cm = () = $sequence =~ /$x/g; 
print " M $cm.";

$x = "F";
my $cf = () = $sequence =~ /$x/g; 
print " F $cf.";

$x = "P";
my $cp = () = $sequence =~ /$x/g; 
print " P $cp.";

$x = "W";
my $cw = () = $sequence =~ /$x/g; 
print " W $cw.";

$x = "V";
my $cv = () = $sequence =~ /$x/g; 
print " V $cv.";

print "\n percentage of hydrophobic aa ".(($ca+$ci+$cl+$cm+$cf+$cp+$cw+$cv)/$l)*100;

my $philic = ($sequence =~ tr/K R H D S T E N Q//);
print "\n percentage of hydrophilic aa are ".($philic/$l)*100;

my $acidic=($sequence =~ tr/ D E //);
print "\n percentage of acidic aa are ".($acidic/$l)*100;

my $basic=($sequence =~ tr/ K R H //);
print "\n percentage of basic aa are ".($basic/$l)*100;

my $b = 0; 
my %data = ( 
    A=>71.09,  R=>16.19,  D=>114.11,  N=>115.09, 
    C=>103.15,  E=>129.12,  Q=>128.14,  G=>57.05, 
    H=>137.14,  I=>113.16,  L=>113.16,  K=>128.17, 
    M=>131.19,  F=>147.18,  P=>97.12,  S=>87.08, 
    T=>101.11,  W=>186.12,  Y=>163.18,  V=>99.14 
); 
foreach $i(@sequence) { 
    $b += $data{$i}; 
} 
my $c = $b - (18 * ($l - 1)); 
print "\nThe molecular weight of the sequence is $c\n";            

my %half_life = (
 'A'    =>   '4.4 hour',   
 'R'    =>    '1 hour',    
 'N'    =>    '1.4 hour',     
 'D'    =>    '1.1 hour',      
 'C'    =>    '1.2 hour',     
 'Q'    =>    '0.8 hour',      
 'E'    =>     '1 hour',      
 'G'    =>     '30 hour',   
 'H'    =>     '3.5 hour',     
 'I'    =>     '20 hour',      
 'L'    =>     '5.5 hour',       
 'K'    =>      '1.3 hour',       
 'M'    =>     '30 hour',     
 'F'    =>     '1.1 hour',  
 'P'    =>     '20 hour',     
 'S'    =>     '1.9 hour',     
 'T'    =>     '7.2 hour',     
 'W'    =>     '2.8 hour',       
 'Y'    =>     '2.8 hour',      
 'V'    =>     '100 hour' );
 #while( my( $key, $value ) = each my %half_life){
    #print "half life are $key: $value\n";  }
	
print " $_ : $half_life{$_}\n" foreach (keys%half_life);

$x = "Y";
my $cy = () = $sequence =~ /$x/g; 
$x = "C";
my $cc = () = $sequence =~ /$x/g; 

print "\n Extinction coefficient = ".(($cy*1490)+($cw*5500)+($cc*125))."\n";

my %gravy=(
'A'=> ' 1.800'  , 
'R'=> '-4.500'  ,
'N'=> '-3.500'  ,
'D'=> '-3.500'  ,
'C'=>  '2.500'  ,
'Q'=> '-3.500'  ,
'E'=> '-3.500'  ,
'G'=> '-0.400'  ,
'H'=> '-3.200'  ,
'I'=>  '4.500'  ,
'L'=>  '3.800'  ,
'K'=> '-3.900'  ,
'M'=>  '1.900'  ,
'F'=>  '2.800'  ,
'P'=> '-1.600'  ,
'S'=> '-0.800'  ,
'T'=> '-0.700'  ,
'W'=> '-0.900'  ,
'Y'=> '-1.300'  ,
'V'=>  '4.200' );   
print "\nGRAVY values are:\n\n";
print "$_ : ".($gravy{$_})/$l."\n"
 foreach (keys%gravy);
 
print "\nABSORBANCE values are:\n\n";
print "$_ : ".(($gravy{$_})/$l)/$c."\n"
 foreach (keys%gravy);
 
print "\nAliphatic Index = ".((($ca/$l)*100)+(((2.9*$cv)/$l)*100)+(3.9*((($ci/$l)*100)+(($cl/$l)*100)))); 
 
exit;
