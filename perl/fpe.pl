#!/usr/bin/env perl

use v5.14;

eval { 1/0 } or die "Floating point exception «$@»";;
