import Data.Graph

myGraph :: Graph
myGraph = fst $ graphFromEdges' [ ("Node 1", 1, [3, 4] )
                                , ("Node 2", 2, [3, 4] )
                                , ("Node 3", 3, [4] )
                                , ("Node 4", 4, [] ) ]

main = do
  print $ "The edges are " ++ (show.edges) myGraph
  print $ "The vertices are " ++ (show.vertices) myGraph

