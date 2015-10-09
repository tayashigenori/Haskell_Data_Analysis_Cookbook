import Math.Statistics (pearson)
import Text.CSV
import Data.List (tails, nub, sort)

calcSimilarities (Left err) = error "error parsing"
calcSimilarities (Right csv) = head $ reverse $ sort $ zip
  [ pearson (convertList a) (convertList b)
  | (a, b) <- pairs csv]
  $ (pairs csv)

convertList :: [String] -> [Double]
convertList = map read

pairs xs = [(x, y) | (x:ys) <- tails (nub xs), y <- ys]

main = do
  let fileName = "07-07_ratings.csv"
  input <- readFile fileName
  let csv = parseCSV fileName input
  print $ calcSimilarities csv
