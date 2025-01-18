#!usr\bin\perl -w 
 
use strict;
use warnings;
use diagnostics;

my ($i,$j,$m,$n,$min,@F,$mismatch,$gap,$match);
my (@x,@y,@b);

##USER INPUT
print "\nEnter the first sequence: ";
chomp( $m= <STDIN> );
print "\nEnter the second sequence: ";
chomp( $n= <STDIN> );

##Splitting at whitespaces
@x=split("",$m);
@y=split("",$n);

print "\nIdentity  Matrix is :\n\n";

$m=scalar(@x);
$n=scalar(@y);

$F[0][0]=0;


for($i=1;$i<=$m;$i++)
{
$F[$i][0]=$F[$i-1][0]+1;
}

for($i=1;$i<=$n;$i++)
{
$F[0][$i]=$F[0][$i-1]+1;
}


for($j=1; $j<=$n;$j++)
{
	for($i=1;$i<=$m;$i++)
	{
		if($x[$i-1] eq $y[$j-1])
		{
			$min= 999999999999999 ;
			if($min > $F[$i-1][$j-1])
			{
				$min = $F[$i-1][$j-1];
			}
		}
		else
		{
			$min= 999999999999999 ;
			if($min > $F[$i-1][$j-1]+1)
			{
				$min=$F[$i-1][$j-1] + 1;
			}
			if($min >$F[$i-1][$j] + 1)
			{
				$min=$F[$i-1][$j] + 1;
			}
			if($min > $F[$i][$j-1] + 1)
			{
				$min=$F[$i][$j-1] + 1;
			}
			
		}
		$F[$i][$j]=$min;
	}
}


for($j=0;$j<=$n;$j++)
{
	for($i=0;$i<=$m;$i++)
	{
		printf("%d  ",$F[$i][$j]);

	}
	printf("\n");
}

print"\nEdit distance(  Levenshtein Distance ) is $F[$n][$m]\n ";
exit;