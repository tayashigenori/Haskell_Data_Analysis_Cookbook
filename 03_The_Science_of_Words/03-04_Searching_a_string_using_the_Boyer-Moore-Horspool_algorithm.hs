
import Data.Map (fromList, (!), findWithDefault)

indexMap xs = fromList $ zip [0..] xs
revIndexMap xs = fromList $ zip (reverse xs) [0..]

bmh :: Ord a => [a] -> [a] -> Maybe Int
bmh pat xs = bmh' (length pat - 1) (reverse pat) xs pat

bmh' :: Ord a => Int -> [a] -> [a] -> [a] -> Maybe Int
bmh' n [] xs pat = Just (n + 1)
bmh' n (p:ps) xs pat
  | n >= length xs         = Nothing
  | p == (indexMap xs) ! n = bmh' (n - 1) ps xs pat
  | otherwise              = bmh' (n + findWithDefault (length pat) (sMap ! n) pMap)
                                  (reverse pat) xs pat
  where sMap = indexMap xs
        pMap = revIndexMap pat

main :: IO ()
main = print $ bmh "Wor" "Hello World"
