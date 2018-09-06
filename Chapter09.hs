module Chapter09 where

import           Control.Monad
import           Data.Char
import           System.IO

main1 = do
  hSetBuffering stdin LineBuffering
  putStrLn "What's your first name?"
  firstName <- getLine
  putStrLn "What's your last name?"
  lastName <- getLine
  let bigFirstName = map toUpper firstName            -- The `let` is required here
      bigLastName  = map toUpper lastName
  putStrLn $ "Hey, " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"

main2 = do
  hSetBuffering stdin LineBuffering
  line <- getLine
  if null line
    then return ()
    else do
      putStrLn $ reverseWords line
      main2
  where reverseWords = unwords . map reverse . words

main3 = do
  c <- getChar
  if c /= ' '                                         -- Replaced with `when` below
    then do
      putChar c
      main3
    else return ()

main3' = do
  c <- getChar
  when (c /= ' ') $ do
    putChar c
    main3'

main4 = do
  colors <- forM
    [1, 2, 3, 4]
    (\a -> do
      putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
      getLine
    )
  putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
  mapM putStrLn colors                                -- or `forM colors putStrLn`

