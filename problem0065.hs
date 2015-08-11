module Problem65 where

import Data.Char (ord)

data Terms = Value Integer | Sum Terms Terms | Ratio Terms Terms deriving Show

evaluate :: Terms -> Terms
evaluate r@(Ratio (Value _) (Value _)) = r
evaluate (Ratio (Value 1) v) = invert $ evaluate v
evaluate (Sum (Value v1) (Ratio (Value v2) (Value v3))) = Ratio (Value $ v1 * v3 + v2) (Value v3)
evaluate (Sum v1 v2) = evaluate (Sum v1 (evaluate v2))
evaluate t = error $ "Unexpected evaluation case" ++ show t

build (a:as) = Sum (Value a) $ go as
  where
  go (x:[]) = oneOver $ Value x
  go (x:xs) = oneOver $ Sum (Value x) $ go xs
  oneOver = Ratio $ Value 1

invert :: Terms -> Terms
invert (Ratio a b) = Ratio b a
invert _ = error "Tried to invert something non-invertable"

as = 2:1:2:go 4
  where
  go n = 1:1:go' n
  go' n = n:go (n+2)

digitSum :: String -> Int
digitSum = foldr (\i -> (+) (ord i - 48)) 0

getNumerator = let Ratio (Value n) _ = evaluate $ build $ take 100 as in n

main = print $ digitSum . show $ getNumerator
