removeNonUppercase :: [Char] -> [Char]
removeNonUppercase s = [ c | c <- s, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int  
addThree x y z = x + y + z  

factorial n = product [1..n]

circumference r = 2 * pi * r
