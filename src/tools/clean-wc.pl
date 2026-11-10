#!/usr/bin/env perl

use diagnostics;
use strict;
use warnings;


########################################
##  Read in the file and clean up the last column of file paths
########################################

while (<STDIN>) {
  my $line = $_;
  my @tmp = split (' ', $line);
  
  if ($tmp[2] =~ /.+\/([^\/]+)$/) {
    $tmp[2] = $1;
  }
  
  printf "%u", $tmp[0];
  printf "\t%u", $tmp[1];

  printf "\t%s", $tmp[2];
  printf "\n";
}


