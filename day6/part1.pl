
#use warnings;
@grid;

for ($i = 0; $i < 999; $i++) {
  for ($j = 0; $j < 999; $j++) {
    $grid[$i][$j] = 0;
  }
}

$input = 'toggle 0,0 through 0,0';
open(HANDLE, 'input.txt');
@lines = <HANDLE>;
chomp @lines;
for (@lines) {
  if (/(?:turn\s*)?(\w{0,3}|toggle)\s(\d{1,3}),(\d{1,3})\sthrough\s(\d{0,3}),(\d{0,3})/) {
    ($action, $x1, $y1, $x2, $y2) = ($1, $2, $3, $4, $5);

    print "I have to $action from ($x1, $y1) to ($x2, $y2)\n";

    $newValue;
    if ($action eq "on") {
      $newValue = 1;
    }
    elsif ($action eq "off") {
      $newValue = 0;
    }
    elsif ($action eq "toggle") {
      $newValue = -1;
    }

    for($i = $x1; $i <= $x2; $i++) {
      for($j = $y1; $j <= $y2; $j++) {
        if ($newValue == -1) {
          $grid[$i][$j] = ($grid[$i][$j] == 1) ? 0 : 1;
        }
        else {
          $grid[$i][$j] = $newValue
        }
      }
    }
  }
  else {
    print "line doesn't match: $_";
  }
}

print findLit(@grid)."\n";

sub findLit {
  $ct = 0;
  foreach $array (@_) {
    foreach $e (@{$array}) {
      #print $e;
      if ($e == 1) {
        $ct++
      }
    }
  }
  return $ct;
}

# part 1
#answered 377891 correct!
