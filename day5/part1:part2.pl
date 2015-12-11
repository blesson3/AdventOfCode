# part 1
#It contains at least three vowels (aeiou only), like aei, xazegov, or aeiouaeiouaeiou.
#It contains at least one letter that appears twice in a row, like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
#It does not contain the strings ab, cd, pq, or xy, even if they are part of one of the other requirements.

# part 2
#It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
#It contains at least one letter which repeats with exactly one letter between them, like xyx, abcdefeghi (efe), or even aaa.

$path = 'input.txt';
open(F,$path);
@lines = <F>;
chomp @lines;
$nice = 0;
foreach (@lines) {
  # part 1
  #if (/([a-z])\1/ && /(?:(a.*)|e.*|i.*|o.*|u.*){3,}/ && /^((?!ab).)*$/ && /^((?!cd).)*$/ && /^((?!pq).)*$/ && /^((?!xy).)*$/) {
  #  print $_."\n";
  #  $nice++;
  #}

  # part 2
  #if (/(.)(.).*\g{1}\g{2}/ && /(.).\g{1}/) {
  #  print $_."\n";
  #  $nice++;
  #}

}
print "Number of nice strings: ".$nice."\n";

#answered 192, too high
#answered 69, correct
