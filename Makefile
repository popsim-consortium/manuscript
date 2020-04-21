all : popSimManu.pdf response-to-reviewers.pdf

popSimManu.pdf: popSimManu.tex model_table.tex popSim.bib

popSimManu.aux : display_items/homo_sapiens_mask_Ragsdale.png display_items/d_mel_Sheehan_mask2.png display_items/homo_sapiens_mask_Gutenkunst.png display_items/homo_sapiens_constant.png 

popSimManu-diff-to-submission.tex : popSimManu.tex 
	latexdiff-git -r 8d336be37e4b1261dcc442c41b61585167c89cfd popSimManu.tex
	mv popSimManu-diff8d336be37e4b1261dcc442c41b61585167c89cfd.tex $@

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
