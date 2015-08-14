
import Data.ByteString (breakSubstring)
import qualified Data.ByteString.Char8 as C

substringFound :: String -> String -> Bool
substringFound query str =
  (not . C.null . snd) $
  breakSubstring (C.pack query) (C.pack str)

main = do
  print $ substringFound "scraf" "swedish scraf mafia"
  print $ substringFound "flute" "swedish scraf mafia"

-- *Main> breakSubstring (C.pack "scraf") (C.pack "swedish scraf mafia")
-- ("swedish ","scraf mafia")
