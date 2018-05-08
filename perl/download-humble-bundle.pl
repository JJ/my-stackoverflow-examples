#!/usr/bin/env perl

use strict;
use warnings;

use v5.14;

use LWP::Simple qw(getstore);
use WWW::WebKit;

my $webkit = WWW::WebKit->new(xvfb => 1);
$webkit->init;

my $dir = "hb";
mkdir($dir);

my $url = shift || die "Necesito el fichero de la página";

$webkit->open($url);
my $page = $webkit->view->get_dom_document->get_document_element->get_outer_html;

my @urls = ($page =~ /"a"\s+href="([^"]+)"/g);

for my $u (@urls) {
  next if $u eq "#";
  my ($file) = ( $u =~ m{com/(.+)\?} );
  say "Storing $u to $dir/$file";
  my $code = getstore( $u, "$dir/$file" );
  say "Got $u with $code";
  
}
