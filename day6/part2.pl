
#use warnings;
my @grid;

for ($i = 0; $i < 999; $i++) {
  for ($j = 0; $j < 999; $j++) {
    $grid[$i][$j] = 0;
  }
}

$input = 'turn off 0,0 through 1,1';
open(HANDLE, 'input.txt');
@lines = <HANDLE>;
chomp @lines;
#@lines = ($input);
for (@lines) {
  if (/(?:turn\s*)?(\w{0,3}|toggle)\s(\d{1,3}),(\d{1,3})\sthrough\s(\d{0,3}),(\d{0,3})/) {
    ($action, $x1, $y1, $x2, $y2) = ($1, $2, $3, $4, $5);

    print "I have to $action from ($x1, $y1) to ($x2, $y2)\n";

    my $bAdd;
    if ($action eq "on") {
      $bAdd = 1;
    }
    elsif ($action eq "off") {
      $bAdd = -1;
    }
    elsif ($action eq "toggle") {
      $bAdd = 2;
    }

    for($i = $x1; $i <= $x2; $i++) {
      for($j = $y1; $j <= $y2; $j++) {
        $grid[$i][$j] += $bAdd;
        if ($grid[$i][$j] < 0) {
          $grid[$i][$j] = 0;
        }
      }
    }
  }
  else {
    print "line doesn't match: $_";
  }
}

print findBrightness(@grid)."\n";

sub findBrightness {
  $b = 0;
  foreach $array (@_) {
    foreach $e (@{$array}) {
      #print $e;
      if ($e != 0) {
        $b += $e;
      }
    }
  }
  return $b;
}

# part 2
#answered 13396307 too low -- Lights have a min brightness of 0
#answered 14110788 correct!
