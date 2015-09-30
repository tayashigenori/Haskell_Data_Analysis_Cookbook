import Data.Graph

myGraph :: Graph
myGraph = buildG bounds edges
  where bounds = (1, 4)
        edges  = [ (1, 3), (1, 4)
                 , (2, 3), (2, 4)
                 , (3, 4) ]

main = do
  print $ "The edges are " ++ (show.edges) myGraph
  print $ "The vertices are " ++ (show.vertices) myGraph

