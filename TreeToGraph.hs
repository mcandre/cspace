-- Andrew Pennebaker, with help from Ivan Miljenovic

module TreeToGraph where

import Data.Text.Lazy (Text, pack)
import Data.List (nub)
import Data.Tree
import Data.Graph.Inductive
import Control.Parallel.Strategies (parMap, rseq)

getEdges :: (Ord t) => Tree t -> [(t, t, Text)]
getEdges (Node x xs) = nub $ parMap rseq (\y -> (x, rootLabel y, pack "")) xs ++ concatMap getEdges xs

treeToGraph :: Tree Int -> Gr Text Text
treeToGraph tree = mkGraph nodes edges
  where
    nodes = parMap rseq (\x -> (x, (pack . show) x)) $ nub $ flatten tree
    edges = getEdges tree
