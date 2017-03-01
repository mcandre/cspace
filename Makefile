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

editorconfig:
	find . \( -wholename '*/bin/*' -o -wholename '*/ts/*.js' -o -wholename '*/dash/lib/*' -o -wholename '*/ash/lib/*' -o -name '*.bc' -o -name '*.aux' -o -name '*.jad' -o -name '*.m' -o -name '*.snu' -o -name '*.txt' -o -name '*.md' -o -name '*.rkt' -o -name '*.clj' -o -name '*.lsp' -o -name .yaws -o -name '*.pdf' -o -name '*.ps' -o -wholename '*/.idea/*' -o -name '*.iml' -o -name '*.ser' -o -name '*.[ps]k' -o -name '*.flip' -o -name '*.db' -o -name '*.log' -o -wholename '*/bower_components/*' -o -wholename '*/vendor/*' -o -wholename '*/*.xcodeproj/*' -o -wholename '*/*.dSYM/*' -o -wholename '*/build/*' -o -wholename '*/*.app/*' -o -name '*.scpt' -o -wholename '*/perl/Makefile' -o -wholename '*/CMakeFiles/*' -o -name '*.cmake' -o -name '*.lock' -o -name '*.cm[io]' -o -name '*.hi' -o -name '*.swiftdoc' -o -name '*.swiftmodule' -o -name '*.rlib' -o -name '*.dylib' -o -name '*.so' -o -name '*.o' -o -name '*.beam' -o -name '*.dump' -o -name '*.pyc' -o -name '*.jar' -o -name '*.class' -o -name '*.bin' -o -wholename '*/tmp/*' -o -name .gitmodules -o -wholename '*/.git/*' -o -wholename '*/node_modules/*' -o -wholename '*/.cabal/*' -o -name '*.ttf' -o -name '*.plist' -o -name '*.dot' -o -name '*.wav' -o -name '*.jpeg' -o -name '*.jpg' -o -name '*.ico' -o -name '*.png' -o -name '*.gif' -o -name .DS_Store -o -name Thumbs.db \) -prune -o -type f -print | pargs -n 100 node_modules/.bin/editorconfig-tools check

chktex:
	chktex .

lint: hlint lacheck style-check lili editorconfig chktex

clean:
	-rm -rf bin/
	-rm *.out
	-rm *.log
	-rm *.aux
	-rm *-intermediate.pdf
	-rm *.dot
