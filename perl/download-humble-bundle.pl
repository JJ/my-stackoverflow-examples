#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use LWP::Simple qw(getstore);
use WWW::Mechanize::Chrome;

my $webkit = WWW::Mechanize::Chrome->new();

my $dir = "hb";
mkdir($dir);

my $url = shift || die "Necesito el fichero de la página";

$webkit->get($url);
my $page = $webkit->content;

my @urls = ($page =~ /"a"\s+href="([^"]+)"/g);

for my $u (@urls) {
  next if $u eq "#";
  my ($file) = ( $u =~ m{com/(.+)\?} );
  say "Storing $u to $dir/$file";
  $webkit->follow_link( $u );
  say "Got $u with $code";
  
}
