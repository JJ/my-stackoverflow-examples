#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use LWP::Simple qw(getstore);
use Path::Tiny;

my $dir = "hb";
mkdir($dir);

my $fichero = shift || die "Necesito el fichero de la página";


my $page = path($fichero)->slurp;

my @urls = ($page =~ /"a"\s+href="([^"]+)"/g);

for my $u (@urls) {
  next if $u eq "#";
  my ($file) = ( $u =~ m{com/(.+)\?} );
  getstore( $u, "$dir/$file" );
  
}
