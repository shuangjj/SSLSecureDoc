
TEX=latex
BIBTEX=bibtex

DOCNAME=SSLProject
VERSION=v1.0

all: $(DOCNAME)_$(VERSION).pdf
	evince $< &

$(DOCNAME)_$(VERSION).pdf: $(DOCNAME).pdf
	mv $< $@

%.pdf: %.dvi
	dvipdf $<

%.dvi: %.tex
	$(TEX) $<
	$(BIBTEX) $(DOCNAME)
	$(TEX) $<
	$(TEX) $<


clean:
	rm -f *.dvi *.pdf *.log *.aux *.bbl *.blg *.out

bakup: $(DOCNAME)_$(VERSION).pdf $(DOCNAME).TEX
	cp $(DOCNAME)_$(VERSION).pdf out
	cp $(DOCNAME).tex out/$(DOCNAME)_$(VERSION).tex