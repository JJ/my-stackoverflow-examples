#!/usr/bin/perl

use strict;
use warnings;

use LWP::Simple;
use Path::Tiny;

my $url = shift || "https://perl.org";
my $content = get($url) or die "Couldn't get $url" ;

if ($content =~ s%<(style|script)[^<>]*>.*?</\1>|</?[a-z][a-z0-9]*[^<>]*>|<!--.*?-->%%g) {
  my $crawled_text = path("../crawled_text.txt");
  $crawled_text->spew_utf8($content)
}   

