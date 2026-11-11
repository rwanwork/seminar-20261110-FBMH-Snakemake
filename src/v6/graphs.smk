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

rule Scatterplot:
  input:
    input_fn1 = OUTPUT_DIR + "/04-combine-perl/{corpus}.tsv",
    input_fn2 = OUTPUT_DIR + "/04-combine-linux/{corpus}.tsv",
  output:
    output_fn1 = OUTPUT_DIR + "/05-graphs/{corpus}.jpg",
    output_fn2 = OUTPUT_DIR + "/05-graphs/{corpus}.png",
    output_fn3 = OUTPUT_DIR + "/05-graphs/{corpus}.eps"
  params:
    corpus = "{corpus}",
    myeps = lambda wildcards: config["my_options"]["postscript"]
  log:
    log_fn1 = OUTPUT_DIR + "/05-graphs/{corpus}.log"
  shell:
    """
    ##  {params.corpus} is available
    mypng="png"
    {TOOLS_DIR}/scatterplot.R --type jpg --perl {input.input_fn1} --linux {input.input_fn2} --output {output.output_fn1} >{log.log_fn1} 2>&1
    {TOOLS_DIR}/scatterplot.R --type ${{mypng}} --perl {input.input_fn1} --linux {input.input_fn2} --output {output.output_fn2} >>{log.log_fn1} 2>&1
    {TOOLS_DIR}/scatterplot.R --type {params.myeps} --perl {input.input_fn1} --linux {input.input_fn2} --output {output.output_fn3} >>{log.log_fn1} 2>&1
    """
