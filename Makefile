all: cspace.tex cspace.hs treetograph.hs ztalloc.hs collatz.hs
	./cspace.hs > cspace.dot
	dot -Tpdf cspace.dot > cspace-intermediate.pdf
	pdflatex cspace

clean:
	-rm cspace.out
	-rm cspace.log
	-rm cspace.aux
	-rm cspace-intermediate.pdf
	-rm cspace.dot