-- Andrew Pennebaker, with help from Ivan Miljenovic

module TreeToGraph where

import Data.List (nub)
import Data.Tree
import Data.Graph.Inductive
import Control.Parallel.Strategies
import Control.Parallel

getEdges :: (Ord t) => Tree t -> [(t, t, String)]
getEdges (Node x xs) = nub $ parMap rseq (\y -> (x, rootLabel y, "")) xs ++ concatMap getEdges xs

treeToGraph :: Tree Int -> Gr String String
treeToGraph tree = mkGraph nodes edges
  where
    nodes = parMap rseq (\x -> (x, show x)) $ nub $ flatten tree
    edges = getEdges tree
