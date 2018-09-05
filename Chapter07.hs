module Chapter07 where

import           Data.Char
import           Data.Function                  ( on )
import           Data.List
import qualified Data.Map                      as Map
import qualified Data.Set                      as Set


{-
numUniques [1,2,2,3,3,3] -- 3
-}
numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub

-- `on`

{-
sortByLength [[5, 4, 5, 4, 4], [1, 2, 3], [3, 5, 4, 3], [], [2], [2, 2]]
  -- [[], [2], [2, 2], [1, 2, 3], [3, 5, 4, 3], [5, 4, 5, 4, 4]]
-}
sortByLength :: [[a]] -> [[a]]
sortByLength = sortBy (compare `on` length)

-- Maps - requires `containers` package

map1 = Map.fromList [("betty","555-2938"),("bonnie","452-2928"),("lucille","205-2928")]

map2 = Map.singleton "joe" "555-1212"

-- Sets

text1 = "I just had an anime dream. Anime... Reality... Are they so different?"
text2 = "The old man left his garbage can out and now his trash is all over my lawn!"

set1 = Set.fromList text1 -- fromList " .?AIRadefhijlmnorstuy"
set2 = Set.fromList text2 -- fromList " !Tabcdefghilmnorstuvwy"

set3 = Set.intersection set1 set2
