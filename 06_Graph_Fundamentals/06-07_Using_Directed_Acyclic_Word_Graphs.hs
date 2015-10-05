import qualified Data.DAWG.Static as D
import Network.HTTP ( simpleHTTP, getRequest,
                      getResponseBody)
import Data.Char (toLower, isAlphaNum, isSpace)
import Data.Maybe (isJust)
--import Data.List (isInfixOf)

main = do
  --let url = "http://norvig.com/big.txt"
  --body <- simpleHTTP (getRequest url) >>= getResponseBody
  -- wget http://norvig.com/big.txt before executing
  body <- readFile "big.txt"
  let corp = corpus body
  print $ isJust $ D.lookup "hello" corp
  print $ isJust $ D.lookup "goodbye" corp
  --print $ "hello" `isInfixOf` body

getWords :: String -> [String]
getWords str = words $ map toLower wordlike
  where wordlike =
          filter (\x -> isAlphaNum x || isSpace x) str

corpus :: String -> D.DAWG Char () ()
corpus str = D.fromLang $ getWords str

