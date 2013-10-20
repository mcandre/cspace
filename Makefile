all: cspace.tex cspace.hs treetograph.hs ztalloc.hs collatz.hs
	./cspace.hs > cspace.dot
	dot -Tpdf cspace.dot > cspace-intermediate.pdf
	pdflatex cspace

lint:
	-hlint .
	-for f in *.tex; do lacheck $$f; done

clean:
	-rm *.out
	-rm *.log
	-rm *.aux
	-rm *-intermediate.pdf
	-rm *.dot
