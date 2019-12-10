
popSimManu.pdf: popSimManu.tex model_table.tex popSim.bib

clean:
	rm -f *.pdf *.aux *.bbl *.log

model_table.tex: src/catalog_table.py
	python3 src/catalog_table.py > model_table.tex

%.pdf : %.tex %.bbl
	while ( pdflatex $<;  grep -q "Rerun to get" $*.log ) do true ; done

%.aux : %.tex
	-pdflatex $<

%.bbl : %.aux
	-bibtex $<

