#!\usr\bin\perl -w  

sub lcs  
{   # longest common subsequence
    my( $u, $v ) = @_;
    return '' unless length($u) and length($v);
    my $longest = '';
    for my $first ( 0..length($u)-1 ) {
        my $char = substr $u, $first, 1;
        my $i = index( $v, $char );
        next if -1==$i;
        my $next = $char;
        $next .= lcs( substr( $u, $first+1), substr( $v, $i+1 ) )  
        unless $i==length($v)-1;
        $longest = $next if length($next) > length($longest);
    }
    return $longest;
} 

sub scs  
{   # shortest common supersequence
    my( $u, $v ) = @_;
    my @lcs = split //, lcs $u, $v;
    my $pat = "(.*)".join("(.*)",@lcs)."(.*)"; 
    my @u = $u =~ /$pat/;
    my @v = $v =~ /$pat/;
    my $scs = shift(@u).shift(@v);
    $scs .= $_.shift(@u).shift(@v) for @lcs;
    return $scs;
}
 
print("\t\t\t---Fragment Assembly--\n"); 
print("\nEnter first fragment: "); 
chomp(my $a = <STDIN>); 
my $u = uc $a;  
print("\nEnter second Frsgament: "); 
chomp(my $b = <STDIN>); 
my $v = uc $b;
printf "\nFragments are %s %s\n", $u, $v;

printf "\nThe Assembled Fragment [Shortest Common Superstring] is : %s\n\n", scs $u, $v;
 