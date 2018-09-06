module Chapter10.RPN where

import           Data.List

{-
solveRPN "10 4 3 + 2 * -" -- -4.0
solveRPN "2.7 ln"         -- 0.9932518
solveRPN "1 2 3 sum 4 +"  -- 10.0
-}
solveRPN :: String -> Float
solveRPN = head . foldl f [] . words
 where
  f (x : y : ys) "*"          = (x * y) : ys
  f (x : y : ys) "+"          = (x + y) : ys
  f (x : y : ys) "-"          = (y - x) : ys
  f (x : y : ys) "/"          = (y / x) : ys
  f (x : y : ys) "^"          = (y ** x) : ys
  f (x     : xs) "ln"         = log x : xs
  f xs           "sum"        = [sum xs]
  f xs           numberString = read numberString : xs
