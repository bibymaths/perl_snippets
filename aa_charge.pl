use strict;

my $file = shift || die "protein.txt <fasta file of sequences>;\n";

my $allowed="ACDEFGHIKLMNPQRSTVWY";# Supported amino acids
my @acids=('C','D','E','Y');    # Acidic for pI
my @bases=('H','K','R');        # Basic for pI

my $water=18.0152;            # mol wt of H2O (added decimals, since
                # it's multiplied by no_aa-1).

                # molecular weights
my %aawt=('A', 89.09, 'C', 121.16, 'D', 133.10, 'E', 147.13, 'F', 165.
+19,
       'G', 75.07, 'H', 155.16, 'I', 131.18, 'K', 146.19, 'L', 131.18,
       'M',149.21, 'N', 132.12, 'P', 115.13, 'Q', 146.15, 'R', 174.20,
       'S',105.09, 'T', 119.12, 'V', 117.15, 'W', 204.23, 'Y', 181.19)
+;

                # pKa/pKbs (&lt; &amp; &gt; are default NT &amp; CT)
my %pka= ('C', 9.0,  'D',  4.05, 'E',  4.45, 'Y', 10.0,
       'H', 5.98, 'K', 10.0,  'R', 12.0);

                # NT pKa
my %nt=  ('A', 7.59, 'E', 7.70, 'M', 7.00,
      'P', 8.36, 'S', 6.93, 'T', 6.82, 'V', 7.44);

                # CT pKa
my %ct=  ('D', 4.55, 'E', 4.75);
                # A280s (half cysteine for C)
my %A280 = ('W', 5690., 'Y', 1280., 'C', 120.);


my %protein;
{
open (IN, $file) || die "Can't open $file\n";
my $tag; my $seq;
while (<IN>) {
  chomp;
  if (/^>/) {
    if ($seq) {$protein{$tag} = uc($seq); undef $seq}
      $tag = $_;
    }
  else {$seq .= $_}
  }
close IN;
}

open OUT, "> $file.txt" || die "Can't open > $file.txt for writing";

foreach my $proteinid (keys %protein) {
  my $protein = $protein{$proteinid};
  my $first = substr($protein,0,1);    # get NT aa
  my $last = substr($protein, -1,1);    # get CT aa

  my %base; my %acid;
  $base{'start'}=1;            # One amino terminus
  $acid{'end'}=1;            # One carboxy terminus

  # NT different for some aa, 7.50 default
  #if($nt{$first}) {$pka{'start'} = $nt{$first}} else {$pka{'start'} =
+ 7.50}

  # CT different for some aa, 3.55 default
  #if($ct{$last}) {$pka{'end'} = $ct{$last}} else {$pka{'end'} = 3.55}

  # count the amino acid composition
  my %residue;
  foreach my $aa (split(//, $allowed)) {$residue{$aa} = ($protein =~ s
+/$aa//g)}

  foreach my $aa (@acids) {
    if($residue{$aa}) {
      $acid{$aa} = $residue{$aa};    # collect acids
    }
  }
  foreach my $aa (@bases) {
    if($residue{$aa}) {
      $base{$aa} = $residue{$aa};    # collect bases
    }
  }

                  # binary search for pI
  my $hi=14;                # Theoretical max
  my $lo=0;                # Theoretical min
  my $pI=7;
  my $old_pI=1;
  my $iterations = 0;

  while(abs($pI-$old_pI)>0.001) {    # Two correct decimals
    if($iterations++ > 15) {    # 14/0.001 &gt; 2^14, so this shouldn'
+t happen
      print STDERR "Excessive iterations. Something's badly wrong\n";
      last;
    }
    my $result=0;
    foreach my $aa (keys(%acid)) {    # Left (acid) side
unless ($pka{$aa}) {print STDERR "pka for $aa NOT FOUND\n"}
      $result += $acid{$aa}/(1+10**($pka{$aa}-$pI));
    }
    foreach my $aa (keys(%base)) {    # Right (base) side
      $result -= $base{$aa}/(1+10**($pI-$pka{$aa}));
    }
    $old_pI = $pI;
    if($result > 0){
      $pI=($pI+$lo)/2;        # Go lower since charge is neg
      $hi=$old_pI;
    } else {
      $pI=($hi+$pI)/2;        # Go higher; charge is pos
      $lo=$old_pI;
    }
  }
  
  print OUT "$proteinid\t$pI\n";
  
}
