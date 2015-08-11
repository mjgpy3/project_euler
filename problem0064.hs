module Problem64 where

terms :: Integer -> [Integer]
terms n = go 1 $ floor sqrt_n
  where
  sqrt_n = sqrt $ fromIntegral n
  go num den = a_next:go num_next den_next
    where
    num_next = (n - (den * den)) `div` num
    den_next = negate $ den - num_next*a_next
    a_next = floor $ (sqrt_n + fromIntegral den) / fromIntegral num_next

sloppilyDetectPeriod n xs =
  let
    a = take n xs
    b = take n $ drop n xs
    c = take n $ drop (n*2) xs
    d = take n $ drop (n*3) xs
  in if a == b && b == c && c == d then n else sloppilyDetectPeriod (n+1) xs

period ts@(t0:t1:t2:t3:t4:t5:t6:t7:t8:t9)
  | all (== t1) (take 10 ts) = 1
  | otherwise = sloppilyDetectPeriod 2 ts

perfects = takeWhile (< 10000) [n*n | n <- [1..]]

main = print $ sum [1 | n <- [1..9999], not (n `elem` perfects), odd $ period $ terms n]
