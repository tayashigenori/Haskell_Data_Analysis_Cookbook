clean raw = map (\s -> read s :: Double) (lines raw)

avg :: [Double] -> Double
avg (x:xs) = a*x + (1-a)*(avg xs)
  where a = 0.95
avg [] = 0

mean xs = (sum xs) / (fromIntegral (length xs))

main = do
  rawInput <- readFile "07-01_input.txt"
  let input = clean rawInput
  print input
  putStrLn $ "mean is " ++ (show.mean) input
  putStrLn $ "moving average is " ++ (show.avg) input
