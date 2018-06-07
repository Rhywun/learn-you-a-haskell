module Chapter02 where

--
-- Baby's first functions
--

doubleMe x = x + x

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100 then x else x * 2

-- The if-statement is an expression:
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

--
-- An intro to lists
--

lostNumbers = [4, 8, 15, 16, 23, 42]

-- A string is a list of characters - these are equivalent:
{-
hello == hello' -- True
-}
hello = "hello"
hello' = ['h', 'e', 'l', 'l', 'o']

--
-- Texas ranges
--

{-
tr -- [13,26,39,52,65,78,91,104,117,130]
-}
tr1 = take 10 [13, 26 ..]

{-
tr2 -- [1,2,3,1,2,3,1,2,3,1]
-}
tr2 = take 10 (cycle [1, 2, 3])

{-
tr3 -- [5,5,5,5,5,5,5,5,5,5]
-}
tr3 = take 10 (repeat 5)

{-
tr4 -- [10,10,10]
-}
tr4 = replicate 3 10

--
-- I'm a list comprehension
--

{-
lc1 -- [2,4,6,8,10,12,14,16,18,20]
-}
lc1 = [ x * 2 | x <- [1 .. 10] ]

lc2 = [ x * 2 | x <- [1 .. 10], x * 2 >= 12 ]

{-
boomBangs [7..13] -- ["BOOM!","BOOM!","BANG!","BANG!"]
-}
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x ]

length' xs = sum [ 1 | _ <- xs ]

{-
removeNonUppercase "Hello, world!" -- "H"
-}
removeNonUppercase st = [ c | c <- st, c `elem` ['A' .. 'Z'] ]

--
-- Tuples
--

-- Error:
{-
t1 = [(1,2),(8,11,5),(4,5)]
            ^^^^^^^^
-}





bbs = zip [1 ..] (boomBangs [1 .. 20])

rightTriangles =
  [ (a, b, c)
  | c <- [1 .. 10]
  , b <- [1 .. c]
  , a <- [1 .. b]
  , a ^ 2 + b ^ 2 == c ^ 2
  , a + b + c == 24
  ]
