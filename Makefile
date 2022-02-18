GOALS = Notes.pdf

PDF_LATEX= pdflatex
LATEX   = latex

FILES_TEX := $(wildcard *.tex)
FILES_IST := $(wildcard  *.ist)
DEP			= Makefile

.PHONY : all 1 2 3 clean cleaner CLEAN
# do not remove some intermediary files:
.SECONDARY:

RPT= 1

all: 3

1 2 3 4: $(GOALS)
2: RPT= 1 2
3: RPT= 1 2 3
4: RPT= 1 2 3 4

clean:
	-rm -f *.dvi
	-rm -f *.aux
	-rm -f *.bbl
	-rm -f *.blg
	-rm -f *.idx
	-rm -f *.lof
	-rm -f *.log
	-rm -f *.lop
	-rm -f *.toc
	-rm -f *.ind
	-rm -f *.ilg
	-rm -f *.fot
	-rm -f *.out
	-rm -f *.nav
	-rm -f *.snm
	-rm -f *.vrb
	-rm -f *.synctex.gz

cleaner CLEAN: clean
	-rm -f $(GOALS)

%.pdf : %.tex

%.pdf : %.tex $(DEP)
	@for idx in $(RPT); do \
	echo "========================================================"; \
	echo "|>             iteration $$idx                          "; \
	echo "========================================================"; \
	echo ; \
	$(PDF_LATEX) -synctex=1 --jobname $* $< ; \
	bibtex $* ;					\
	if [ -r $*.ist ]; then \
		makeindex -s $*.ist  $* ; \
	fi ; \
	done

%.dvi : %.tex

%.dvi : %.tex $(DEP)
	@for idx in $(RPT); do \
	echo "========================================================"; \
	echo "|>             iteration $$idx                          "; \
	echo "========================================================"; \
	echo ; \
	$(LATEX) --src-specials --jobname $* $< ; \
	bibtex $* ;					\
	if [ -r $*.ist ]; then \
		makeindex -s $*.ist  $* ; \
	fi ; \
	done

%.ps : %.dvi
	dvips -o $@  $<


$(GOALS): $(FILES_TEX) $(FILES_IST)

ifeq (0,${MAKELEVEL})
$(GOAL_BASENAME).pdf: $(DEP) $(DEP_PDF)
	$(MAKE) $@ TMP_EXT="" RPT="$(RPT)"
$(GOAL_BASENAME).dvi: $(DEP) $(DEP_DVI)
	$(MAKE) $@ TMP_EXT="" RPT="$(RPT)"
$(GOAL_BASENAME).ps : $(DEP) $(DEP_PS)
	$(MAKE) $@ TMP_EXT="" RPT="$(RPT)"
endif

#EOF
