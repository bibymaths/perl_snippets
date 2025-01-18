#!\usr\bin\perl -w 

use strict;
use warnings;
use diagnostics;

print "\n Enter the no. of motif sequences: ";
my $t=<stdin>;
chomp($t);
print "\n Enter the length of motif sequence: ";
my $n=<stdin>;
chomp($n);

my ($i,$j);
my @s; 
print "\n Enter the $t sequences ( in Uppercase ): \n";
for($i=0 ; $i<$t ; $i++)
{
	$s[$i]=<stdin>;
	chomp($s[$i]);
}

my (@p,@temp);
my $k;
for($i=0 ; $i<$t ; $i++)
{
	my $A=0; my $T=0; my $G=0; my $C=0;	
	@temp=split("",$s[$i]);
	my $x=scalar(@temp);
	if($i==0)
	{
	for($j=0 ; $j<$x ; $j++)
	{
		if($temp[$j]eq'A')
		{
			$A++;
			$p[$j][0]=$A;
		}
		if($temp[$j]eq'T')
		{
			$T++;
			$p[$j][1]=$T;
		}
		if($temp[$j]eq'G')
		{
			$G++;
			$p[$j][2]=$G;
		}
		if($temp[$j]eq'C')
		{
			$C++;
			$p[$j][3]=$C;
		}
		for($k=0;$k<4;$k++)
		{
			if($p[$j][$k])
			{}
			else
			{
			$p[$j][$k]=0;
			}
		}
	}
	}
	else
	{
	for($j=0 ; $j<$x ; $j++)
	{
		if($temp[$j]eq'A')
		{
			$p[$j][0]++;
		}
		if($temp[$j]eq'T')
		{
			$p[$j][1]++;
		}
		if($temp[$j]eq'G')
		{
			$p[$j][2]++;
		}
		if($temp[$j]eq'C')
		{
			$p[$j][3]++;
		}
	}
	}
}

print"\n\nProfile: \nA\tT\tG\tC\t\n";
for($j=0;$j<$n;$j++)
{
	for($i=0;$i<4;$i++)
	{
		print "$p[$j][$i]\t";
	}
	print "\n";
}

print"\n\nProbability Profile:\nA\tT\tG\tC\t\n\n";
for($j=0;$j<$n;$j++)
{
	for($i=0;$i<4;$i++)
	{
		$p[$j][$i]=$p[$j][$i]/$t;
		print "$p[$j][$i]\t";
	}
	print "\n";
}

print"\nInsert the PARENT sequence : ";
my $seq=<stdin>;
chomp($seq);
my @se=split("",$seq);
my @prob;
my @str;
for($i=0 ; $i<scalar(@se)-$n+1 ;$i++)
{
	my $prod=1;
	$str[$i]=substr($seq,$i,$n);
	print"prob(";
	for($j=$i ; $j<$i+$n; $j++)
	{
	if($se[$j] eq 'A')
	{	
		$k=0;	
	}
	if($se[$j] eq 'T')
	{	
		$k=1;	
	}
	if($se[$j] eq 'G')
	{	
		$k=2;	
	}
	if($se[$j] eq 'C')
	{	
		$k=3;	
	}
	print $se[$j];
	$prod=$prod*$p[$j-$i][$k];
	}
	$prob[$i]=$prod;
	print ") = $prob[$i]\n";	
}

my $max=0;
my $mprob;
for($i=0 ; $i<scalar(@se)-$n+1 ;$i++)
{
	if($prob[$i]>$max)
	{
		$max=$prob[$i];
		$mprob=$str[$i];
	}
}

print "\n\nThe Motif through PROFILE based approach is  $mprob\n\n";