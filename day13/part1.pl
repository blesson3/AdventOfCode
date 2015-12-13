open(HANDLE, "input.txt");
@lines = <HANDLE>;
chomp @lines;

# part 2 - added "me"
my %ha = ("me"=>()); # happiness arrangement

for (@lines) {
  if (/(\w+)\swould\s(gain|lose)\s(\d*)\shappiness\sunits\sby\ssitting\snext\sto\s(\w*)/) {
    my ($person, $action, $by, $nextTo) = ($1, $2, $3, $4);
    if ($action eq "lose") {
      $by *= -1;
    }
    if ($ha{$person}) {
      $ha{$person}{$nextTo} = $by;
    }
    else {
      $ha{$person} = {$nextTo => $by};
    }
  }
}

use Algorithm::Permute;
$mostChange = 0;
@mostChangePerm = ();
@keys = keys %ha;
$keysCt = @keys+0;
my $p_iterator = Algorithm::Permute->new ( \@keys );

while (my @perm = $p_iterator->next) {
  # calculate happiness
  my $h = 0;
  for ($i = 0; $i < @perm-1; $i++) {
    $h += $ha{$perm[$i]}{$perm[$i+1]};
    $h += $ha{$perm[$i+1]}{$perm[$i]};
  }
  # do final adding which adds the first to last
  $h += $ha{$perm[0]}{$perm[$#perm]};
  $h += $ha{$perm[$#perm]}{$perm[0]};
  # print "Final $h : $mostChange for @perm\n";
  if ($h > $mostChange) {
    $mostChange = $h;
    @mostChangePerm = @perm;
  }
}

print "$mostChange: @mostChangePerm\n";

# for (keys %ha) {
#   print "$_: ";
#   for $k (keys $ha{$_}) {
#     print "$k: ".$ha{$_}{$k}."   ";
#   }
#   print "\n";
# }

#part 1
#answered 733 correct!
#part 2
#answered 725 correct!
