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
