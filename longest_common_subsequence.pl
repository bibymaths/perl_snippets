#!usr\bin\perl -w 
 
sub lcs  
{    
    # longest common subsequence
    my( $u, $v ) = @_;
    return '' unless length($u) and length($v);
    my $longest = '';
    for my $first ( 0..length($u)-1 )  
    {
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
 

print("\t\t\t\t--LCS--\n"); 
print("\nEnter first sequence: "); 
chomp(my $a = <STDIN>); 
my $u = uc $a;   

print("\nEnter second sequence: "); 
chomp(my $b = <STDIN>); 
my $v = uc $b; 

printf "\nSequences are [%s] [%s]\n\n", $u, $v;
printf "The LCS [Longest common subsequence] is : %s\n\n", lcs $u, $v;

 