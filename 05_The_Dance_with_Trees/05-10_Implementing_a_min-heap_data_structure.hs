import MinHeap

-- ?? outputs different result from the textbook
main = do
  let heap = foldr (\x -> insert x x)
               empty [11, 5, 3, 4, 8]
  print $ weights heap
  print $ weights $ iterate deleteMin heap !! 1
  print $ weights $ iterate deleteMin heap !! 2
  print $ weights $ iterate deleteMin heap !! 3
  print $ weights $ iterate deleteMin heap !! 4

--import Data.Heap (MinHeap, MaxHeap, empty, insert, view)
--minheapFromList :: [Int] -> MinHeap Int
--minheapFromList ls = foldr insert empty ls
--
--maxheapFromList :: [Int] -> MaxHeap Int
--maxheapFromList ls = foldr insert empty ls
--
--main = do
--  let myList = [11, 5, 3, 4, 8]
--  let minHeap = minheapFromList myList
--  let maxHeap = maxheapFromList myList
--  print $ view minHeap
--  print $ view maxHeap
