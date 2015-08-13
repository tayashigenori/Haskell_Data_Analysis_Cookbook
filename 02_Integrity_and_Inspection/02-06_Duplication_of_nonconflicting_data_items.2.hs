import Text.CSV (parseCSV, Record)
import Data.Map (fromListWith)
import Control.Applicative ((<|>))

data Item = Item { name :: String
                 , color :: Maybe String
                 , cost :: Maybe Float
                 } deriving Show

main :: IO ()
main = do
  let fileName = "02-06.csv"
  input <- readFile fileName
  let csv = parseCSV fileName input
  either handleError doWork csv

handleError = print

doWork :: [Record] -> IO ()
doWork csv = print $
             fromListWith combine $
             map parseToTuple csv

combine :: Item -> Item -> Item
combine item1 item2 =
    Item { name = name item1
         , color = color item1 <|> color item2
         , cost = cost item1 <|> cost item2 }

parseToTuple :: [String] -> (String, Item)
parseToTuple record = (name item, item)
    where item = parseItem record

-- does not work yet!!!!
parseItem :: Record -> Item
parseItem record =
    Item { name = record !! 0
         , color = case reads(record !! 1)::[(String, String)] of
           [(s1, s2)] -> Just s2
           _ -> Nothing
         , cost = case reads(record !! 2)::[(Float, String)] of
           [(c, "")] -> Just c
           _ -> Nothing }


