#!\usr\bin\perl  

  %f = ( A=> 1, D=> 2, F=> 3, H=> 4, K=>5, M=> 6, P=>7, R=>8, T=>9, W=>10, C=>11, E=>12, G=>13, I=>14, L=>15, N=>16, Q=>17, S=>18, V=>19, 
         Y=> 20, START=> 21, STOP=> 22); 
   
  %ambi = ( A => 'A', C=> 'C', G=> 'G', T=> 'T', AG=> 'R', CT=> 'Y', AC=>'M', GT=>'K', CG=>'S', AT=>'W', ACT=>'H', CGT=> 'B', ACG=> 'V', AGT=>'D',  
            ACGT=> 'N');   
   
  open( F1, "print.txt"); 
  while(<F1>)  
  { 
            $a[$i++] = $_; 
  } 
   
   print("\n Enter the sequence:");  
   $sequence = <STDIN>; 
   chomp $sequence; 
    
    @seq= split('', $sequence); 
     
     foreach(@seq) 
     { 
               $k=0; 
               $x= $f{$_};   #$x is the Position of AA 
               $seq1= $a[$x-1];  #@seq1 is the CODONS of Respective AA 
                
                @seq2 = split('', $seq1); 
                 
                 $len[$m++] = scalar(@seq2); 
                  foreach(@seq2) 
                  { 
                   $seq12[$j][$k] = $_; 
                   $k++; 
                  } 
                   $j++; 
     } 
      
      $i=0; 
      $k++; 
      foreach(@len) 
      { 
       $k=0; 
       if($i == 0) 
       { 
        for($j=0; $j< $_; $j++) 
        { 
          $nuc[$k] = $seq12[$i][$j]; 
          $k++; 
        } 
         
         $i++; 
       } 
       else 
       { 
        $x = $_; 
       }  
        
     @nuc1 = @nuc; 
     foreach(@nuc1) 
     { 
      my $y = $_; 
       
       for($j = 0; $j<$x; $j++) 
       { 
          $nuc[$k] = $_.$seq12[$i][$j]; 
          $k++; 
       }  
       last;
       
     } 
       
      $i++; 
     } 
    
     
     $i= 0; 
     foreach(@nuc) 
     { 
      @{$nei[$i]}= split('', $_); 
       
       print"@{$nei[$i]}"; 
       print"\n"; 
        
        $i++; 
     } 
      
      print"\n"; 
       
       for ($m = 0; $m < ( 3*scalar(@len) ); $m++ ) 
       { 
        %count = NULL; 
         
         for($n=0; $n<$i; $n++) 
         { 
          $x= $nei[$n][$m]; 
          $count{$x}= $count{$x} + 1; 
         } 
          
          @atgc= ("A", "C","G", "T"); 
           
           for($a=0; $a<4; $a++)
            { 
             $b= $atgc[$a]; 
              
   if($count{$b} != NULL) 
             { 
               if($count{$b} == 12) 
                 {  
                    $cnt[$m] = $b; 
                 } 
               elsif($b =~ /A/) 
               { 
                $cnt[$m] = $cnt[$m].'A'; 
               } 
               elsif($b =~ /C/) 
               { 
                $cnt[$m] = $cnt[$m].'C'; 
               } 
               elsif($b =~ /G/) 
               { 
                $cnt[$m] = $cnt[$m].'G'; 
               } 
                
                else 
                { 
                 $cnt[$m] = $cnt[$m].'T'; 
                } 
               } 
             }
 
        $qwe = $cnt[$m]; 
        $dna[$m] = $ambi{$qwe}; 
       
        }
     
        print ("\n The converted AA is : @dna\n"); 
        <STDIN>; 