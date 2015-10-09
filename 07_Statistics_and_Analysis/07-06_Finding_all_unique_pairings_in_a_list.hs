import Data.List (tails, nub, sort)

pairs xs = [(x, y) | (x:ys) <- tails (nub xs), y <- ys]
main = print $ pairs [1,2,3,3,4]
