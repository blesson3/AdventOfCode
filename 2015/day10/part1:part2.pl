
$input = '1113122113';
$buffer = '';
# part 1 - 40 iterations
# part 2 - 50 iterations
for ($i = 0; $i < 50; $i++) {
  $buffer = '';
  $numCharsRead = 0;
  $break = 1;
  while ($numCharsRead < length($input)) {
    $count = 1;
    $char = substr($input, $numCharsRead, 1);
    while(substr($input, $numCharsRead+$count, 1) == $char) {
      $count++;
    }
    $buffer .= $count.$char;
    $numCharsRead += $count;
  }
  $input = $buffer;
}

print "LENGTH IS ".length($buffer)."\n";
