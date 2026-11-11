#!/usr/bin/env perl
# Copyright 2026 Raymond Wan (rwan.work@gmail.com)
#   https://github.com/rwanwork/seminar-20261110-FBMH-Snakemake
#
# This file is part of seminar-20261110-FBMH-Snakemake.
#
# seminar-20261110-FBMH-Snakemake is free software: you can redistribute
# it and/or modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation, either version 3 of
# the License, or (at your option) any later version.
#
# seminar-20261110-FBMH-Snakemake is distributed in the hope that
# it will be useful, but WITHOUT ANY WARRANTY; without even the implied
# warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
# the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program. If not, see <https://www.gnu.org/licenses/>.

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


