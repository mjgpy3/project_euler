module Problem64 where

import Data.List (isPrefixOf)

terms :: Integer -> [Integer]
terms n = go 1 $ floor sqrt_n
  where
  sqrt_n = sqrt $ fromIntegral n
  go num den = a':go num' den'
    where
    num' = (n - den^2) `div` num
    den' = negate $ den - num'*a'
    a' = floor $ (sqrt_n + fromIntegral den) / fromIntegral num'

detectPeriod a_0 i (x:xs)
  | x == 2*a_0 = i
  | otherwise = detectPeriod a_0 (i+1) xs

perfects = takeWhile (< 10000) [n*n | n <- [1..]]

main = print $ sum [1 | n <- [1..9999], not (n `elem` perfects), odd $ detectPeriod (floor $ sqrt $ fromIntegral n) 1 $ terms n]
