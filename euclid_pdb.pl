use strict;
use warnings;

my @points;
while (<DATA>) {
    last if /^TER$/;
    push @points, getpoints($_);
}
my @ref = map getpoints($_), <DATA>;

for my $p (@points) {
    getcoords($p, \@ref);
}

sub getpoints {
    my $line = shift;
    my @data = unpack "A31 A8 A8 A8", $line;
    shift @data;
    return \@data;
}
sub getcoords {
    my ($p, $ref) = @_;
    my ($p1,$p2,$p3) = @$p;
    my $max=0;
    my ($x,$y,$z);
    for my $aref ( @$ref ) {
        my ( $x1, $y1, $z1 ) = @$aref;  
        my $dist = sqrt(
            ($x1-$p1)**2 +
            ($y1-$p2)**2 +
            ($z1-$p3)**2
        ); 
        print "distance from ($p1 $p2 $p3) to ( $x1, $y1, $z1 ) is $dist\n"; 

        if ( $dist > $max ) {
            $max = $dist;
            $x=$x1;
            $y=$y1;
            $z=$z1; 
        }
    }
    print "maximum value is : $max\n";
    print "co ordinates are : $x $y $z\n";
}

__DATA__
ATOM   1279 C    ALA    81      -1.925 -11.270   1.404
ATOM   1280 O    ALA    81      -0.279   9.355  15.557
ATOM   1281 OXT  ALA    81      -2.188  10.341  15.346
TER
ATOM   1282 N    THR    82      29.632   5.205   5.525
ATOM   1283 H1   THR    82      30.175   4.389   5.768
ATOM   1284 H2   THR    82      28.816   4.910   5.008
