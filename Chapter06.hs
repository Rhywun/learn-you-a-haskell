module Chapter06 where

import           Data.Function                  ( (&) )
import           Data.List                      ( sort )

--
-- Curried functions
--

multiplyThree x y z = x * y * z

compare100 = compare 100

tenDiv = (10 /)

--
-- Some higher-orderism is in order
--

{-
applyTwice (+3) 10 -- 16
-}
applyTwice :: (t -> t) -> t -> t
applyTwice f x = f (f x)

{-
zipWith' (+) [1,2,3] [4,5,6] -- [5,7,9]
-}
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ []       _        = []
zipWith' _ _        []       = []
zipWith' f (x : xs) (y : ys) = f x y : zipWith' f xs ys

{-
zip [1,2,3,4,5] "hello"       -- [(1,'h'),(2,'e'),(3,'l'),(4,'l'),(5,'o')]
flip' zip [1,2,3,4,5] "hello" -- [('h',1),('e',2),('l',3),('l',4),('o',5)]
-}
flip' :: (a -> b -> c) -> b -> a -> c
flip' f x y = f y x

--
-- Maps and filters and folds
--

-- What is the largest number under 100,000 that's divisible by 3829?
e1 = head (filter (\x -> x `mod` 3829 == 0) [100000, 99999 ..])

-- What is the sum of all odd squares that are smaller than 10,000?
e2 = sum (takeWhile (< 10000) (filter odd (map (^ 2) [1 ..])))
e2' = map (^ 2) [1 ..] & filter odd & takeWhile (< 10000) & sum

collatz :: (Integral a) => a -> [a]
collatz 1 = [1]
collatz n | even n = n : collatz (n `div` 2)
          | odd n  = n : collatz (n * 3 + 1)

howManyChainsGTFifteen = map collatz [1 .. 100] & filter (\xs -> length xs > 15) & length

-- How many elements does it take for the sum of the roots of all natural numbers to exceed 1000?
e3 = map sqrt [1 ..] & scanl1 (+) & takeWhile (< 1000) & length & (+ 1)

--
-- $
--

e4 = map ($ 3) [(4 +), (10 *), (^ 2), sqrt]

--
-- .
--

e5 = map (negate . abs) [5, -3, -6, 7, -3, 2, -19, 24] & sort

e6 = replicate 10 . product . map (* 3) . zipWith max [1, 2, 3, 4, 5] $ [4, 5, 6, 7, 8]
