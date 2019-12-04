
popSimManu.pdf: popSimManu.tex model_table.tex
	pdflatex popSimManu.tex
	bibtex popSimManu
	pdflatex popSimManu.tex

clean:
	rm -f *.pdf *.aux *.bbl *.log


model_table.tex: src/catalog_table.py
	python3 src/catalog_table.py > model_table.tex
