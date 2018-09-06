import System.Random

threeCoins :: StdGen -> (Bool, Bool, Bool)
threeCoins gen = let (coin1, newGen1) = random gen
                     (coin2, newGen2) = random newGen1
                     (coin3, newGen3) = random newGen2
                  in (coin1, coin2, coin3)

main = do
  gen <- getStdGen
  putStrLn $ take 20 (randomRs ('a', 'z') gen)
