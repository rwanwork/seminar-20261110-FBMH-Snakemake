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

def GatherPerl (wc):
  results = []  ##  Initialise empty list

  ##  Iterate through each row of the table
  for row in fileslist_panda.itertuples (index = False):
    curr_ID = str (row.ID)  ##  Convert integer to string
    curr_corpus = row.corpus  ##  Current "corpus" in this row
    curr_filename = row.filename

    ##  Check for equality between wildcard corpus and current corpus
    if wc.corpus == curr_corpus:
      d = [OUTPUT_DIR + "/02-count-perl/{f}.count".format (f=curr_filename)]
      results.extend (d)  ##  Add it to the list

  ##  Print out the results
  print (results, file=sys.stderr)

  return results


def GatherLinux (wc):
  results = []

  for row in fileslist_panda.itertuples (index = False):
    curr_ID = str (row.ID)  ##  Convert integer to string in order to compare correctly
    curr_corpus = row.corpus
    curr_filename = row.filename

    if wc.corpus == curr_corpus:
      d = [OUTPUT_DIR + "/03-clean-linux/{f}.clean".format (f=curr_filename)]
      results.extend (d)
      
  return results


rule CombinePerl:
  input:  GatherPerl
  output:  OUTPUT_DIR + "/04-combine-perl/{corpus}.tsv"
  shell:
    """
    cat {input} >{output}
    """


rule CombineLinux:
  input:  GatherLinux
  output:  OUTPUT_DIR + "/04-combine-linux/{corpus}.tsv"
  shell:
    """
    cat {input} >{output}
    """

