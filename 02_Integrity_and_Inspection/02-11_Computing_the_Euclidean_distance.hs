import Text.CSV (parseCSV)

main :: IO ()
main = do
  let fileName = "02-10.csv"
  input <- readFile fileName
  let csv = parseCSV fileName input
  
  let points = either (\e -> []) (map toPoint . myFilter) csv
  
  let test1 = [2, 1]
  let test2 = [-10, -10]
  
  if (not.null) points then do
    print $ minimum $ map (euclidianDist test1) points
    print $ minimum $ map (euclidianDist test2) points
  else putStrLn "Error: no points to compare"

toPoint record = map (read :: String -> Float) record
euclidianDist p1 p2 = sqrt $ sum $
                      zipWith (\x y -> (x - y)^2) p1 p2
myFilter = filter (\x -> length x == 2)
