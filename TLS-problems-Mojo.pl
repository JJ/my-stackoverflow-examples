#!/usr/bin/env perl

use strict;
use warnings;
use v5.14;

use Mojo::UserAgent;
my $ua =  Mojo::UserAgent->new;
my $response = $ua->get("https://github.com/JJ/IV/milestones");
say $response->result->body;
