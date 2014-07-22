#!/usr/bin/env runhaskell

-- Andrew Pennebaker
--
-- Produces an image similar to the graph at http://en.wikipedia.org/wiki/Hailstone_sequence

module Ztalloc where

import Data.Tree
import Control.Parallel.Strategies (parMap, rseq)

import Collatz hiding (main)

ztalloc :: Int -> [Int]
ztalloc n = [n * 2, (n - 1) `div` 3]

enotsliah :: Int -> (Int, [Int])
enotsliah n = (n, filter (/= 0) (ztalloc n))

limitDepth :: Int -> Tree t -> Tree t
limitDepth d (Node x xs)
        | d == 0 = Node x []
        | otherwise = Node x (parMap rseq (limitDepth (d - 1)) xs)

toTreeString :: (Show t) => Tree t -> Tree String
toTreeString (Node x xs) = Node (show x) $ parMap rseq toTreeString xs

main :: IO ()
main = putStrLn $ drawTree $ toTreeString $ limitDepth 5 $ unfoldTree enotsliah 1
