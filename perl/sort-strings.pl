#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

my @array=qw(a b c d foo bar baz);
my @prefixed = map { "STRING$_"} @array;

say for sort { sans_prefix($a) cmp sans_prefix($b) } @prefixed;

sub sans_prefix {
  my ($no_prefix) = ($_[0] =~ /STRING(\w+)/);
  return $no_prefix;
}
  
  
