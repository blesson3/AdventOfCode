open(HANDLE,'input.txt');
my @lines = <HANDLE>;
chomp @lines;
my $numCharCode = 0;
my $numCharString = 0;

for (@lines) {
  $numCharString += length($_);
  $escapedString = '"'.quotemeta($_)."\"";
  $numCharCode += length $escapedString;
  print $escapedString."\n";
}

print $numCharString." : ".$numCharCode."\n";
print "answer is ".($numCharCode-$numCharString)."\n";

#part 2
# answered: 1446 too low
# answered: 2046 correct!
