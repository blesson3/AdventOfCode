open(HANDLE,' input.txt');
my @lines = <HANDLE>;
chomp @lines;
my $numCharCode = 0;
my $numCharString = 0;

for (@lines) {
  $numCharCode += length;
  @escapes =~ /(\\\\|\\x.\w|\\[\"])/;
  $_ =~ s/(\\\\|\\x.\w|\\[\"])/E/g;
  $_ = substr($_,1,length($_)-2);
  $numCharString += length $_;
  for $e (@escapes) {
    $numCharString -= length($e)-1;
  }
}

print $numCharString." : ".$numCharCode."\n";
print "answer is ".($numCharCode-$numCharString)."\n";

#part 1
# answered: 1236 too low
# answered: 1333 correct!
