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

naiveDetectPeriod n xs =
  let
    repeated = concat $ replicate 4 $ take n xs
  in
    if repeated `isPrefixOf` xs then n else naiveDetectPeriod (n+1) xs

period ts = if firstTenAreEqual then 1 else detectPeriod
  where
  firstTenAreEqual = all (== (head ts)) (take 10 ts)
  detectPeriod = naiveDetectPeriod 2 ts

perfects = takeWhile (< 10000) [n*n | n <- [1..]]

main = print $ sum [1 | n <- [1..9999], not (n `elem` perfects), odd $ period $ terms n]
