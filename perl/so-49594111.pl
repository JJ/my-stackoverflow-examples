#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

say @ARGV;

while (<STDIN>) {
        $_ =~ s/$ARGV[0]/$ARGV[1]/g;
        print STDOUT $_;
}

exit(0);
