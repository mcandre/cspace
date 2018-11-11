#!/usr/bin/env runhaskell

-- Collatz Space
-- Andrew Pennebaker

module CSpace where

import Data.Text.Lazy
import Data.Tree
import Data.Graph.Inductive()
import Data.GraphViz
import Data.GraphViz.Printing
import Data.GraphViz.Attributes.Complete
import TreeToGraph
import Ztalloc hiding (main)

ztallocParams :: GraphvizParams n Text Text () Text
ztallocParams = nonClusteredParams {
    globalAttributes = [GraphAttrs [ImageScale NoScale], NodeAttrs [Shape Circle]],
    fmtNode = \(_,l) -> [(Label . StrLabel) l],
    fmtEdge = \(_,_,l) -> [(Label . StrLabel) l]
    }

main :: IO ()
main = putStr $ unpack $ renderDot $ toDot $ graphToDot ztallocParams $ treeToGraph $ limitDepth 13 (unfoldTree enotsliah 1)
