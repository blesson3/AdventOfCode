use Digest::MD5 qw(md5 md5_hex md5_base64);

my $key = 'ckczppom';
my $s;
$i = 0;
while (!isValid($s)) {
  $i++;
  $s = md5_hex($key.$i);
}

print "$i\n";

sub isValid {
  my $s = pop;
  # 5 for part 1, 6 for part 2
  if (substr($s,0,6) eq '000000') {
    return 1;
  }
  return 0;
}

#part 1
# answered: ckczppom117947 -- not right.
# answered: 117947 too high
# answered: 117946 correct!
