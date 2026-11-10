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
