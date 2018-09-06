import           Control.Monad
import           Data.Char

main' = forever $ do
  putStr "Input? "
  line <- getLine
  putStrLn $ map toUpper line

main = do
  contents <- getContents
  putStr $ map toUpper contents
  