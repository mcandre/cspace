#!/usr/bin/env runhaskell

-- Andrew Pennebaker
--
-- Collatz Conjecture described at http://en.wikipedia.org/wiki/Hailstone_sequence

module Collatz where

import Test.QuickCheck

collatz :: Int -> Int
collatz n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

hailstone :: Int -> [Int]
hailstone n
  | n <= 1 = [1]
  | otherwise = n:hailstone (collatz n)

collatzConjecture :: Int -> Bool
collatzConjecture n = last (hailstone n) == 1

main :: IO ()
main = quickCheck collatzConjecture
