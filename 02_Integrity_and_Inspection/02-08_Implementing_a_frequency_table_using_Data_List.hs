import Data.List (group, sort)

data Color = Red | Green | Blue deriving (Show, Ord, Eq)

main :: IO ()
main = do
  let items = [Red, Green, Green, Blue, Red, Green, Green]
  let freq =
       map (\x -> (head x, length x)) . group . sort $ items
  print freq

-- sort items
-- group it
-- map (\x -> (head x, length x)) it
