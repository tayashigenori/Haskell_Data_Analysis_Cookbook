ngram :: Int -> [a] -> [[a]]
ngram n xs
  | n <= length xs  =  take n xs : ngram n (drop 1 xs)
  | otherwise       =  []

main = print $ ngram 3 "hello world"
