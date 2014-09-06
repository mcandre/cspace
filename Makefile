BIN=bin/cspace

FLAGS=-O2 -Wall -fwarn-tabs --make -fforce-recomp -o $(BIN) -main-is CSpace

all: test

test: $(BIN)
	$(BIN) > cspace.dot
	dot -Tpdf cspace.dot > cspace-intermediate.pdf
	pdflatex -interaction=nonstopmode cspace
	convert cspace.pdf cspace.png

$(BIN): CSpace.hs cspace.tex CSpace.hs TreeToGraph.hs Ztalloc.hs Collatz.hs
	mkdir -p bin/
	ghc $(FLAGS) CSpace.hs

hlint:
	-hlint .

lacheck:
	-for f in *.tex; do lacheck $$f; done

style-check:
	-style-check.rb *.tex

lili:
	bundle exec lili .

lint: hlint lacheck style-check lili

clean:
	-rm -rf bin/
	-rm *.out
	-rm *.log
	-rm *.aux
	-rm *-intermediate.pdf
	-rm *.dot
