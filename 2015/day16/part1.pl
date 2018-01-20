open(HANDLE,'input.txt');
my @lines = <HANDLE>;
chomp @lines;

my @sues = ();
for (@lines) {
  if (/Sue\s(\d+):\s/) {
    my ($number) = ($1);
    $_ =~ s/Sue\s\d+:\s//g;
    my @attributes = split ', ', $_;
    $sues[$number-1] = {};
    for my $a (@attributes) {
      if ($a =~ /(\w+):\s(\d+)/) {
        my ($attribute, $amount) = ($1, $2);
        $sues[$number-1]{$attribute} = $amount;
      }
    }
  }
}


open(REALSUE, 'real_sue.txt');
@slines = <REALSUE>;
chomp @slines;
for (@slines) {
  if (/(\w+):\s(\d+)/) {
    my ($attribute, $amount) = ($1, $2);
    # print "$1: $2\n";
    $realAttr{$attribute} = $amount;
    # print "$attribute: ".$realAttr{$attribute}."\n";
  }
}

$theRealSue = 0;
$highestMatches = 0;

$number = 1;
for $s (@sues) {
  my $matches = 0;
  %s = %{$s};
  for (keys %s) {
    $realAmount = $realAttr{$_};
    $amount = $s{$_};
    print "Comparing $realAmount with $amount for $_\n";
    if ($_ eq "trees" || $_ eq "cats") {
      if ($realAmount < $amount) {
        $matches++;
      }
    }
    elsif ($_ eq "pomeranians" || $_ eq "goldfish") {
      if ($realAmount > $amount) {
        $matches++;
      }
    }
    elsif ($realAmount == $amount) {
      $matches++;
    }
  }
  if ($matches > $highestMatches) {
    $highestMatches = $matches;
    $theRealSue = $number;
  }

  print "Sue $number had $matches matches.\n";
  $number++;
  # last;
}

print "The real sue is $theRealSue with $highestMatches\n";

# part 1
# answered: 103 correct!

# part 2
# answered: 405 correct!
