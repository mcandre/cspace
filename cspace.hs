#!/usr/bin/env runhaskell

-- Collatz Space
-- Andrew Pennebaker
--
-- Requirements
--
-- Haskell 2010 (http://haskell.org/)
-- Haskell graphviz (http://hackage.haskell.org/packages/archive/graphviz/latest/doc/html/Data-GraphViz.html)
-- Graphviz (http://www.graphviz.org/)
--
-- Example
--
-- $ ./cspace.hs > cspace.dot
-- $ dot -Tpdf cspace.dot > cspace-intermediate.pdf
-- $ pdflatex cspace

module CSpace where

import Data.Tree
import Data.Graph.Inductive
import Data.GraphViz
import TreeToGraph
import Ztalloc hiding (main)

ztallocParams :: GraphvizParams String String () String
ztallocParams = nonClusteredParams {
		globalAttributes = ga,
		fmtNode = fn,
		fmtEdge = fe
	}
	where
		ga = [
			GraphAttrs [ImageScale NoScale],
			NodeAttrs [Shape Circle]
			]
		fn (n,l) = [(Label . StrLabel) l]
		fe (f,t,l) = [(Label . StrLabel) l]

main :: IO ()
main = putStr $ printDotGraph $ graphToDot ztallocParams $ treeToGraph $ limitDepth 13 (unfoldTree enotsliah 1)