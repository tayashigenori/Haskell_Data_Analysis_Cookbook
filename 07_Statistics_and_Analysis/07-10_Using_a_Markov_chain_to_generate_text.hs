import Data.MarkovChain
import System.Random (mkStdGen)

main = do
  rawText <- readFile "big.txt"
  let g = mkStdGen 100
  putStrLn $ "Character by character: \n"
  putStrLn $ take 100 $ run 3 rawText 0 g
  putStrLn $ "\nWord by word: \n"
  putStrLn $ unwords $ take 100 $ run 2 (words rawText) 0 g

