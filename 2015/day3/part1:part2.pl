$delta = 1000;
open(HANDLE, "input.txt");
$input = <HANDLE>;
$x = $delta/2;
$y = $delta/2;
$rX = $delta/2; # robo santa
$rY = $delta/2; # robo santa

$matrix[$x][$y]++; # initial
$matrix[$rX][$rY]++; # initial

$ct = 1;
$turn = 0;
for (split '', $input) {
  if ($turn % 2 == 0) {
    # santas turn
    $tmpX = \$x;
    $tmpY = \$y;
    $name = "santa";
  }
  else {
    # robos turn
    $tmpX = \$rX;
    $tmpY = \$rY;
    $name = "robo";
  }
  print ${$tmpY}."\n";
  if ($_ eq "<") {
    ${$tmpX}--;
  } elsif ($_ eq ">") {
    ${$tmpX}++;
  } elsif ($_ eq "^") {
    ${$tmpY}++;
  } elsif ($_ eq "v") {
    ${$tmpY}--;
  }
  print "$name is at (${$tmpX}, ${$tmpY}) there are ".$matrix[${$tmpX}][${$tmpY}]." presents\n";
  if (!$matrix[${$tmpX}][${$tmpY}]) {
    $ct++;
    print "ct up!\n";
  }
  $matrix[${$tmpX}][${$tmpY}]++;

  $turn++;
}

print "$ct\n";

# part 1
#answered 2592 correct!

# part 2
#answered 2360 correct!
