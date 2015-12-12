
my $input = 'hepxxzaa';#'hijklmmn';

# Passwords must include one increasing straight of at least three letters, like abc, bcd, cde, and so on, up to xyz. They cannot skip letters; abd doesn't count.
# Passwords may not contain the letters i, o, or l, as these letters can be mistaken for other characters and are therefore confusing.
# Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.


while (!isValid($input)) {
  $input = increaseLetterByOne($input);
  if ($input =~ /(i|o|l)/) {
    # input contains i or o or l
    @parts = split m/(i|o|l)/, $input, 2;
    $input = $parts[0].chr(ord($1)+1).('a' x (length($input)-length($parts[0])-1))
  }
}
print $input."   <-- next valid password\n";

sub increaseLetterByOne {
  my ($input) = (pop @_);
  my @array;
  @array = split '',$input;
  $ord = ord($array[$#array]);
  $ord++;
  $nc = chr($ord);
  if (ord($nc) >= ord('a') && ord($nc) <= ord('z')) {
    #valid
    return substr($input,0,length($input)-1).$nc;
  } elsif (ord($nc) == ord('z')+1) {
    return increaseLetterByOne(substr($input,0,length($input)-1))."a";
  }
  else {
    die "tried to increase next letter by one, but found end of string\n";
  }
}

sub isValid {
  my $input = pop @_;
  if (findIncreasingCharacters($input) && !($input =~ /(i|o|l)/) && findTwoDoubleCharacters($input)) {
    print "$input is valid\n";
    return 1;
  }
  else {
    #print "$input is not valid\n";
    return 0;
  }
}


sub findTwoDoubleCharacters {
  my $input = pop @_;
  if ($input =~ /.*(\w)\1.*(\w)\2.*/ && !($1 eq $2)) {
    return 1;
  }
  return 0;
}

sub findIncreasingCharacters {
  my $input = pop @_;
  my $c = -2; # ascii value
  my $ct = 0;
  for (split '', $input) {
    $c++;
    if (chr($c) eq $_) {
      #print "found increasing letters ".chr($c)." $_\n";
      $ct++;
      if ($ct > 1) {
        last;
      }
    }
    else {
      $c = ord($_); # new letter
      $ct = 0;
    }
  }
  if ($ct > 1) {
    return 1;
  }
  return 0;
}

# part 1
# answered hepxxyzz correct!

# part 2
# answered heqaabcc correct!
