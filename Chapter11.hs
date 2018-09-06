module Chapter11 where

main1 = do
  line <- fmap reverse getLine
  putStrLn $ "You said \"" ++ line ++ "\" backwards!"

