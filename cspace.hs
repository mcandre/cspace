#!/usr/bin/env runhaskell

-- Collatz Space
-- Andrew Pennebaker

module CSpace where

import Data.Tree
import Data.Graph.Inductive
import Data.GraphViz
import TreeToGraph
import Ztalloc hiding (main)

ztallocParams :: GraphvizParams String String () String
ztallocParams = nonClusteredParams {
  globalAttributes = [GraphAttrs [ImageScale NoScale], NodeAttrs [Shape Circle]],
  fmtNode = \(n,l) -> [(Label . StrLabel) l],
  fmtEdge = \(f,t,l) -> [(Label . StrLabel) l]
  }

main :: IO ()
main = putStr $ printDotGraph $ graphToDot ztallocParams $ treeToGraph $ limitDepth 13 (unfoldTree enotsliah 1)
