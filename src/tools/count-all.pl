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

##  Include libraries for handling arguments and documentation
use AppConfig;
use AppConfig::Getopt;


########################################
##  Process arguments
########################################

##  Create AppConfig and AppConfig::Getopt objects
my $config = AppConfig -> new ({
  GLOBAL => {
    DEFAULT => undef,      ##  Default value for new variables
  }
});

my $getopt = AppConfig::Getopt -> new ($config);

##  Program parameters
$config -> define ("input", {
  ARGCOUNT => AppConfig::ARGCOUNT_ONE,
  ARGS => "=s"
});                        ##  Input file

##  Process the command-line options
$config -> getopt ();


########################################
##  Validate the settings
########################################

if (!defined ($config -> get ("input"))) {
  printf STDERR "EE\tInput file required with the --input option!\n";
  exit (1);
}
my $input_arg = $config -> get ("input");


########################################
##  Read in the file and perform count
########################################

my $count_ch = 0;
my $count_word = 0;

open (my $fp, "<", $input_arg) or die "EE\tCould not open $input_arg for input!";
while (<$fp>) {
  my $line = $_;
  my @tmp_ch = split //, $line;
  $count_ch += scalar (@tmp_ch);
  
  my @tmp_word = split (' ', $line);
  $count_word += scalar (@tmp_word);
}
close ($fp);


########################################
##  Print out the results
########################################

printf "%u", $count_word;
printf "\t%u", $count_ch;

##  Take everything after the last slash (/), if there is one
if ($input_arg =~ /.+\/([^\/]+)$/) {
  $input_arg = $1;
}

printf "\t%s", $input_arg;
printf "\n";

