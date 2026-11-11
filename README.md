Using Snakemake to develop workflows for bioinformatics analysis
================================================================


Introduction
------------

This repository contains the slides and examples for a talk given on 2026/11/10 at the University of Manchester's Faculty of Biology, Medicine, and Health's for the bioinformatics seminar series.  The examples are located in the `src/` directory, while the source of the slides is LaTeX and they can be found in the `slides/` directory.

The Calgary and Canterbury corpora were downloaded from [here](https://corpus.canterbury.ac.nz/descriptions/), with the first 1,024 lines of select files saved to the `data/` directory.


Abstract of the talk
--------------------

For some, the term "bioinformatics" has become synonymous with the development of pipelines or workflows.  Since no single piece of software can do everything, workflows are used to show how software can be chained together to perform some desired analysis.  Many excellent tools exist for defining these workflows.  In this talk, I will talk about one such tool called Snakemake.  First described in a publication in 2012, nowadays, you can easily find on-line documentation, tutorials, and YouTube videos that explain how to use it.  I will discuss some of the features of Snakemake, as well as give some advice on how I usually get started on a workflow.  Hopefully, members of the audience will have a better idea of whether it is the right tool for them.


Requirements
------------


| Software            | Version    | Required?   | Ubuntu package name    |
| :-----------------: | :--------: | :---------: | :--------------------: |
| Snakemake           | 7.32.4     | Yes         | snakemake              |
| Graphviz            | 14.1.2     | No          | graphviz               |
| Perl                | 5.42.3     | Yes         | perl                   |
| R                   | 4.6.1-5    | Yes         | r-base-core            |

This example was run on an Ubuntu 26.10 system with additional software summarised in the above table.


Files and Directories
---------------------

The directory is structured as follows.  Please see the slides for information about the source code.

    .                        Top-level directory, where the p.pdf slides reside.
    ├── data                 Test data
    │   ├── calgary            Small snippets of the Calgary corpus
    │   └── canterbury         Small snippets of the Canterbury corpus
    ├── slides               LaTeX source of the slides
    └── src                  Source code of the examples
        ├── tools
        ├── v1
        ├── v2
        ├── v3
        ├── v4
        ├── v5
        └── v6


About synMTS
------------

This software was implemented while I was at the University of Manchester.  My contact details:

     E-mail:  rwan.work@gmail.com

My homepage is [here](http://www.rwanwork.info/).

The latest version can be downloaded from [GitHub](https://github.com/rwanwork/seminar-20261110-FBMH-Snakemake).

If you have any information about bugs, suggestions for the documentation or just have some general comments, feel free to contact me via e-mail or as a [GitHub issue](https://github.com/rwanwork/seminar-20261110-FBMH-Snakemake/issues).


Copyright and License
---------------------

     seminar-20261110-FBMH-Snakemake
     Copyright (C) 2026 by Raymond Wan

seminar-20261110-FBMH-Snakemake is distributed under the terms of the GNU General Public License (GPL, version 3 or later) -- see the file LICENSE for details.

Permission is granted to copy, distribute and/or modify this document under the terms of the GNU Free Documentation License, Version 1.3 or any later version published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts and no Back-Cover Texts. A copy of the license is included with the archive as LICENSE.
        
