#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use LWP::Simple qw(getstore);
use WWW::Mechanize::Firefox;

my $webkit = WWW::Mechanize::Firefox->new();

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
  my $code = getstore( $u, "$dir/$file" );
  say "Got $u with $code";
  
}
