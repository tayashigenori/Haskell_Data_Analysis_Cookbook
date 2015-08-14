{-# LANGUAGE OverloadedStrings #-}

import Data.ByteString.Search.KarpRabin (indicesOfAny)
import qualified Data.ByteString as BS

main = do
  let needles = [ "preparing to go away"
                , "is some letter of recommendation"]
-- wget "norvig.com/big.txt" before executing
  haystack <- BS.readFile "big.txt"
  print $ indicesOfAny needles haystack

