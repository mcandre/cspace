all: cspace.tex cspace.hs treetograph.hs ztalloc.hs collatz.hs
	runhaskell cspace.hs > cspace.dot
	dot -Tpdf cspace.dot > cspace-intermediate.pdf
	pdflatex cspace

hlint:
	-hlint .

lacheck:
	-for f in *.tex; do lacheck $$f; done

style-check:
	-style-check.rb *.tex

lint: hlint lacheck style-check

clean:
	-rm *.out
	-rm *.log
	-rm *.aux
	-rm *-intermediate.pdf
	-rm *.dot
