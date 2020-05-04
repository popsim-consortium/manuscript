all : popSimManu.pdf response-to-reviewers.pdf

popSimManu.pdf: popSimManu.tex model_table.tex popSim.bib

popSimManu-diff-to-submission.tex : popSimManu.tex 
	latexdiff-git -r 8d336be37e4b1261dcc442c41b61585167c89cfd popSimManu.tex
	mv popSimManu-diff8d336be37e4b1261dcc442c41b61585167c89cfd.tex $@

popSimManu-diff-to-master.tex : popSimManu.tex 
	latexdiff-git -r master popSimManu.tex
	mv popSimManu-diffmaster.tex $@

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

%.png : %.pdf
	convert -density 300 $< -flatten $@

%.pdf : %.md
	pandoc -f markdown -o $@ $<
