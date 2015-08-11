import Text.Regex.Posix ((=~))

looksLikeName :: String -> Bool
looksLikeNmae str = str =~ "^[A-Z][a-z]{1,30}$" :: Bool

punctuations = [ '!', '"', '#', '$', '%'
               , '(', ')', '.', ',', '?']
removePunctuation = filter (`notElem` punctuations)

specialSymbols = ['/', '-']

replaceSpecialSymbols = map $
                          (\c -> if c `elem` specialSymbols
                                 then ' ' else c)

createTuples (x: y: xs) = (x ++ " " ++ y) :
                            createTuples (y: xs)
createTuples _ = [ ]

main :: IO ()
main = do
  input <- readFile "02-04.txt"
  let cleanInput =
    (removePunctuation.replaceSpecialSymbols) input
  let wordPairs = createTuples $ words cleanInput
  let possibleNames =
    filter (all looksLikeName . words) wordPairs
  print possibleNames

