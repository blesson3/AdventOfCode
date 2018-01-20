use warnings;
open(HANDLE, "input.txt");
my @lines = <HANDLE>;
chomp @lines;
my %r = (); # Reindeer => {info}
for (@lines) {
  if (/(\w+)\scan\sfly\s(\d+)\skm\/s\sfor\s(\d+)\sseconds,\sbut\sthen\smust\srest\sfor\s(\d+)\sseconds./) {
    my ($name, $speed, $duration, $rest) = ($1, $2, $3, $4);
    $r{$name} = {'speed'=>$speed,'duration'=>$duration,'rest'=>$rest};
  }
}

my $durationOfRace = 2503;

# my $furthest = 0;
# for (keys %r) {
#   $distance = run($durationOfRace, $r{$_});
#   if ($furthest < $distance) {
#     $furthest = $distance;
#   }
#   print "$_ ran ".$distance." km\n";
# }
# print "The furthest is $furthest\n";

# for (keys %race) {
#   print "$_: ";
#   for $k (sort keys $race{$_}) {
#     print $k." => ".$race{$_}{$k}."  ";
#   }
#   print "\n";
# }


# part 1 - distance
# answered: 2565 too low
# answered: 2660 correct!

# part 2 - scoring
# answered: 1256 correct!


# simulation below
use constant ACTIVE => 1;
use constant RESTING => 0;


my %race = (); # Reindeer => {raceInfo}
for (keys %r) {
  $race{$_} = {"distance"=>0,"nextStateIn"=>$r{$_}{"duration"},"state"=>ACTIVE,"score"=>0};
}
# distance
# nextStateIn (seconds)
# state
my $furthest = 0;
for (my $i = 1; $i < $durationOfRace+1; $i++) {
  # print "Pass $i: \n";
  for (keys %r) {
    if ($race{$_}{"state"} == ACTIVE) {
      $race{$_}{"distance"} += $r{$_}{"speed"};
      # print "$_ ran ".$r{$_}{"speed"}."\n";
    }
    $race{$_}{"nextStateIn"}--;
    if ($race{$_}{"nextStateIn"} == 0) {
      #change in state
      if ($race{$_}{"state"} == ACTIVE) {
        $race{$_}{"state"} = RESTING;
        $race{$_}{"nextStateIn"} = $r{$_}{"rest"};
        # print "$_ started resting for ".$r{$_}{"rest"}." seconds\n";
      }
      else {
        $race{$_}{"state"} = ACTIVE;
        $race{$_}{"nextStateIn"} = $r{$_}{"duration"};
        # print "$_ started running again for ".$r{$_}{"duration"}." seconds\n";
      }
    }
    if ($race{$_}{'distance'} > $furthest) {
      $furthest = $race{$_}{'distance'};
    }
  }
  #scoring
  for (keys %r) {
    if ($race{$_}{'distance'} >= $furthest) {
      $race{$_}{'score'}++;
      # print "$_ is in the lead increasing points\n";
    }
  }
}

$furthest = 0;
for (keys %race) {
  if ($furthest < $race{$_}{"distance"}) {
    $furthest = $race{$_}{"distance"};
  }
  print "$_ ran ".$race{$_}{"distance"}." km\n";
}
print "The furthest is $furthest\n";

for (keys %race) {
  print "$_: ";
  for $k (sort keys $race{$_}) {
    print $k." => ".$race{$_}{$k}."  ";
  }
  print "\n";
}


# sub run {
#   # print "@_\n";
#   # exit;
#   my $r = pop @_;
#   my %r = %{$r};
#   my $duration = pop @_;
#   for $k(keys %r) {
#     print "$k: ".$r{$k};
#     print "\n";
#   }
#   my $distance = 0;
#   my $s = 1;
#   my $j = 0;
#   for (my $i = 1; $i < $duration+1; $i++) {
#     print "Step $i: ";
#     if ($s == 1) {
#       $distance += $r{'speed'};
#     #  print "ran\n";
#     }
#     else {
#     #  print "rested\n";
#     }
#     $j++;
#     print $r{'rest'}."  ".$r{'duration'}."$j\n";
#     if (($j % $r{'rest'} == 0 && $s == 0) || ($j % $r{'duration'} == 0 && $s == 1)) {
#       print "state change from $s to ";
#       $s = ($s == 1)?0:1;
#       $j = 0;
#       print "$s\n";
#     }
#   }
#   return $distance;
# }
