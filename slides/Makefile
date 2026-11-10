p.pdf:  background.tex intro.tex tips.tex p.tex structure.tex summary.tex finalex.tex
	lualatex p
	biber p
	lualatex p
	lualatex p

clean:
	rm -f p.pdf *.aux p.bbl p.bcf p.blg p.log p.run.xml p.nav p.out p.snm p.toc p.upa
	rm -f p.vrb *~
