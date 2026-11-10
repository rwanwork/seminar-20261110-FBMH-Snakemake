#!/usr/bin/env Rscript

##############################
##  Read in libraries and modules

#  Load in libraries
library (ggplot2)
library (Cairo)  #  For transparency
library (docopt)  #  See:  https://github.com/docopt/docopt.R
#library (stringr)  # str_to_title ()


#####################################################################
##  Setup constants
#####################################################################

FIGURE_WIDTH <- 18
FIGURE_HEIGHT <- 12
FIGURE_DPI <- 600


#####################################################################
##  Functions
#####################################################################


#####################################################################
##  Process arguments using docopt
#####################################################################

"Usage:  scatterplot.R --perl PERL --linux LINUX --output OUTPUT --type IMGTYPE

Options:
  --perl PERL  Input Perl generated file
  --linux LINUX  Input Linux generated file
  --output OUTPUT  Output file
  --type IMGTYPE  Type of graph to output

.
" -> options

# Retrieve the command-line arguments
opts <- docopt (options)

##  Make a copy of each argument
PERL_ARG <- opts$perl
LINUX_ARG <- opts$linux
OUTPUT_ARG <- opts$output
IMGTYPE_ARG <- opts$type


######################################################################
##  Read in the perl table
######################################################################

perl_in_fn <- PERL_ARG

x <- read.table (perl_in_fn, sep="\t", header=FALSE)

colnames(x) <- c("words", "characters", "filename")

##  Add a new column with "perl" as every value
x$method <- "perl"


######################################################################
##  Read in the linux table
######################################################################

linux_in_fn <- LINUX_ARG

y <- read.table (linux_in_fn, sep="\t", header=FALSE)

colnames(y) <- c("words", "characters", "filename")

##  Add a new column with "linux" as every value
y$method <- "linux"


######################################################################
##  Combine the two tables
######################################################################

z <- rbind (x, y)


######################################################################
##  Plot the graph
######################################################################

ggplot_obj <- ggplot (z, aes (x=words, y=characters))
ggplot_obj <- ggplot_obj + geom_point()
ggplot_obj <- ggplot_obj + facet_wrap (~ method, ncol=2)


######################################################################
##  Write out the graph
######################################################################

out_fn <- OUTPUT_ARG
if (IMGTYPE_ARG == "jpg") {
  ggsave (out_fn, plot=ggplot_obj, device="jpg", width = FIGURE_WIDTH, height = FIGURE_HEIGHT, dpi = FIGURE_DPI, units = "cm")
} else if (IMGTYPE_ARG == "eps") {
  ggsave (out_fn, plot=ggplot_obj, device="eps", width = FIGURE_WIDTH, height = FIGURE_HEIGHT, dpi = FIGURE_DPI, units = "cm")
} else if (IMGTYPE_ARG == "png") {
  ggsave (out_fn, plot=ggplot_obj, device="png", width = FIGURE_WIDTH, height = FIGURE_HEIGHT, dpi = FIGURE_DPI, units = "cm")
}

