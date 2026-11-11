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

def FindPath (wc):
  results = []

  for row in fileslist_panda.itertuples (index = False):
    curr_ID = str (row.ID)  ##  Convert integer to string in order to compare correctly
    curr_corpus = row.corpus
    curr_filename = row.filename

    if wc.fn == curr_filename:
      d = [DATA_DIR + "/{c}/{f}".format (c=curr_corpus,f=curr_filename)]
      results.extend (d)

  return results


rule FileTop:
  input:  FindPath
  output:  OUTPUT_DIR + "/01-top/{fn}.head"
  shell:
    """
    head -n 1000 {input} >{output}
    """

rule CountWC:
  input:  OUTPUT_DIR + "/01-top/{fn}.head"
  output:  OUTPUT_DIR + "/02-count-linux/{fn}.count"
  shell:
    """
    wc -w -c {input} >{output}
    """

rule CountPerl:
  input:  OUTPUT_DIR + "/01-top/{fn}.head"
  output:  OUTPUT_DIR + "/02-count-perl/{fn}.count"
  shell:
    """
    {TOOLS_DIR}/count-all.pl --input {input} >{output}
    """

rule CleanWC:
  input:  OUTPUT_DIR + "/02-count-linux/{fn}.count"
  output:  OUTPUT_DIR + "/03-clean-linux/{fn}.clean"
  shell:
    """
    cat {input} | {TOOLS_DIR}/clean-wc.pl >{output}
    """
