import Data.Graph
import Data.Array ((!))

graph :: Graph
graph = buildG bounds edges
  where bounds = (1, 7)
        edges = [ (1, 2), (1, 5)
                , (2, 3), (2, 4)
                , (5, 6), (5, 7)
                , (3, 1) ]

breadth g i = bf [] [i]
  where bf :: [Int] -> [Int] -> [Int]
        bf seen forest | null forest = []
                       | otherwise   = forest ++
                                       bf (forest ++ seen) (concat (map goDeeper forest))
          where goDeeper v = if elem v seen
                               then [] else (g ! v)

main = do
  print $ breadth graph 1
