
import Data.List.Split (splitOn)

main = do
  input <- readFile "03-06.txt"
  -- lines
  let ls = lines input
  print $ ls
  -- words
  let ws = words $ ls !! 2
  print ws
  -- csv
  let cs = splitOn "," $ ls !! 3
  print cs
  -- split on any characters
  --let ds = splitOn "an" $ ls !! 4
  let ds = splitOn "e" $ ls !! 4
  print ds
