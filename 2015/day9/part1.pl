
my %graph = ();
open(HANDLE, 'input.txt');
@lines = <HANDLE>;
chomp @lines;
for (@lines) {
  if (/(\w*)\sto\s(\w*)\s=\s(\d*)/) {
    ($city1, $city2, $weight) = ($1, $2, $3);
    # add first city path
    if ($graph{$city1}) {
      $graph{$city1}{$city2} = $weight;
    }
    else {
      $graph{$city1} = {$city2 => $weight};
    }

    # add second city path
    if ($graph{$city2}) {
      $graph{$city2}{$city1} = $weight;
    }
    else {
      $graph{$city2} = {$city1 => $weight};
    }
  }
}
use Algorithm::Permute;
$longestDistance = 0;
@longestPerm = ();
@keys = keys %graph;
$keysCt = @keys+0;
my $p_iterator = Algorithm::Permute->new ( \@keys );
while (my @perm = $p_iterator->next) {
  $distance = 0;
   for($i = 0; $i < $keysCt-1; $i++) {
     print "$i single distance between ".$perm[$i]." and ".$perm[$i+1]." is ".$graph{$perm[$i]}{$perm[$i+1]}."\n";
     $distance += $graph{$perm[$i]}{$perm[$i+1]};
   }
   if ($distance > $longestDistance) {
     $longestDistance = $distance;
     @longestPerm = @perm;
   }
}

print "Shortest distance is $longestDistance for @longestPerm\n\n";
