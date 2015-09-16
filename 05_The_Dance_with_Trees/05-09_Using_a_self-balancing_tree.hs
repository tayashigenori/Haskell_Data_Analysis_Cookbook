import Data.Tree.AVL
import Data.COrdering

main = do
  let avl = asTree fstCC [4,2,1,5,3,6]
  let min = tryReadL avl
  let max = tryReadR avl
  print min
  print max


--import qualified Data.Set as S
--main = do
--  let s = S.fromList [4,2,1,5,3,6]
--  let min = S.findMin s
--  let max = S.findMax s
--  print min
--  print max
