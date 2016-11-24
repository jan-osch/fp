quickSort [] = []
quickSort (x:r) = (quickSort([y | y <- r, y<x])) ++ [x] ++ (quickSort([y | y <- r, y >=x]))
