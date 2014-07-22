BIN=cspace

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is CSpace

all: test

test: cspace
	./cspace > cspace.dot
	dot -Tpdf cspace.dot > cspace-intermediate.pdf
	pdflatex -interaction=nonstopmode cspace
	convert cspace.pdf cspace.png

cspace: CSpace.hs cspace.tex CSpace.hs TreeToGraph.hs Ztalloc.hs Collatz.hs
	ghc $(FLAGS) CSpace.hs

hlint:
	-hlint .

lacheck:
	-for f in *.tex; do lacheck $$f; done

style-check:
	-style-check.rb *.tex

lint: hlint lacheck style-check

clean:
	-rm cspace
	-rm *.exe
	-rm *.out
	-rm *.log
	-rm *.aux
	-rm *-intermediate.pdf
	-rm *.dot
