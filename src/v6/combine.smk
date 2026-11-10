def GatherPerl (wc):
  results = []

  for row in fileslist_panda.itertuples (index = False):
    curr_ID = str (row.ID)  ##  Convert integer to string in order to compare correctly
    curr_corpus = row.corpus
    curr_filename = row.filename

    if wc.corpus == curr_corpus:
      d = [OUTPUT_DIR + "/02-count-perl/{f}.count".format (f=curr_filename)]
      results.extend (d)

  print (results)
      
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

