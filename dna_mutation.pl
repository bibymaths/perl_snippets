print "\n\t#################### MUTATION OF DNA ####################\n\n";
print "ENTER THE FILENAME OF THE DNA SEQUENCE:= ";
$dnafilename = <STDIN>;
chomp $dnafilename;
unless ( open(DNAFILE, $dnafilename) ) 
{
    print "Cannot open file \"$dnafilename\"\n\n";
    goto h;
}
my $DNA = <DNAFILE>;
close DNAFILE;

my $i;
my $mutant;
$mutant = mutate($DNA);
print "Mutate DNA\n\n";
print "HERE IS THE ORIGINAL DNA SEQUENCE:\n";
print "$DNA\n\n";
print "HERE IS THE MUTANT DNA SEQUENCE:\n";
print "$mutant\n\n";
print "HERE ARE THE 10 SUCCESSIVE MUTATIONS:\n\n";
for ($i=0 ; $i < 10 ; ++$i)
  {
    $mutant = mutate($mutant);
    print "$mutant\n";
        print WRITE "$mutant\n";
  }

sub mutate
  {
        my($dna) = @_;
        my($position) = randomposition($dna);
        my $current_base = substr($dna, $position, 1);
        my $newbase;
    do
  {
        $newbase = randomnucleotide();
  }
        until ($newbase ne $current_base);
        substr($dna,$position,1,$newbase);
        return $dna;
  }
sub randomposition
  {
        my($string) = @_;
        return int rand length $string;
  }
sub randomelement
  {
    my(@array) = @_;
    return $array[rand @array];
  }
sub randomnucleotide
  {
    my(@nucleotides) = ('A', 'C', 'G', 'T');
    return randomelement(@nucleotides);
  }
