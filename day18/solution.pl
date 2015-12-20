# use warnings;
use Data::Dumper;

# part 1
# answered 814 correct!

# part 2
# answered 924 correct!

open(HANDLE, 'input.txt');
@lines = <HANDLE>;
chomp @lines;
@grid = ();
my $col = 0;
my $row = 0;
for $r (@lines) {
  # print $r."\n";
  $row = 0;
  for $c (split '',$r) {
    if (!$grid[$col]) {
      $grid[$col] = ();
    }
    $grid[$col][$row] = $c;
    $row++;
  }
  $col++;
}

$height = $col;
$width = $col;

$grid[$width-1][$height-1] = "#";
$grid[0][$height-1] = "#";
$grid[$width-1][0] = "#";
$grid[0][0] = "#";

# do steps
$numSteps = 100;
for (my $k = 0; $k < $numSteps; $k++) {
  @grid = step(@grid);
  print "Post step ".($k+1)."\n";
  printGrid(@grid);
  print "\n";
}
print howManyLightsOn(@grid)." lights are on after the last step.\n\n";

sub howManyLightsOn {
  my $lights;
  for (@_) {
    for (@{$_}) {
      $lights++ if ($_ eq "#");
    }
  }
  return $lights;
}

sub printGrid {
  #print
  for (@_){
    for (@{$_}) {
      print "$_";
    }
    print "\n";
  }
}

sub step {
  my @bufferGrid = @{$self->{@_}};
  my $x = 0;
  my $y = 0;
  for (@grid) {
    $y = 0;
    for $c (@{$_}) {
      # print "iterating through ($x, $y) as '$c'\n";

      my $currentState = ($c eq "#") ? 1 : 0;
      my $nextState = 0;
      my $neighborsOn = 0;
      # print "Finding neighbors for ($x, $y)\n";
      for (my $i = $x-1; $i < $x+2; $i++) {
        for (my $j = $y-1; $j < $y+2; $j++) {
          if (!($i == $x && $j == $y) && validIndex($i,$j)) {
            # print "Neighbor ($i, $j) is ".(($grid[$i][$j])?'on':'off')."\n";
            if ($grid[$i][$j] eq "#") {
              $neighborsOn++;
              # print "Neighbor ($i,$j) is on! \t(".$grid[$i][$j].")\n"
            }
            else {
              # print "Neighbor ($i,$j) is off! \t(".$grid[$i][$j].")\n"
            }
          }
        }
      }
      if (($currentState == 1 && ($neighborsOn == 2 || $neighborsOn == 3)) || ($currentState == 0 && $neighborsOn == 3)) {
        $nextState = 1;
      }
      if (($x == $width-1 && $y == $height-1) || ($x == 0 && $y == $height-1) || ($x == $width-1 && $y == 0) || ($x == 0 && $y == 0)) {
        $nextState = 1;
      }
      # print "($x, $y) Current: $currentState (".$grid[$x][$y].") Next: $nextState ($neighborsOn)\n";
      $bufferGrid[$x][$y] = ($nextState == 1)?'#':'.';
      $y++;
    }
    $x++;
  }
  # @grid = @bufferGrid;
  return @bufferGrid;
}


sub validIndex {
  my ($x, $y) = ($_[0],$_[1]);
  # print "Checking ($x, $y) ";
  $valid = ($x >= 0 && $y >= 0 && $x <= $width-1 && $y <= $height-1) ? 1 : 0;
  # print "is ".$valid."\n";
  return $valid;
}
