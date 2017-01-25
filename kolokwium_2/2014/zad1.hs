perm :: Ord a => [a] -> [[a]]
perm x =


permHelper :: [a] -> [[a]]
permHelper [] = [[]]
permHelper [x] = [[x]]
permHelper list = foldr (\c previous -> map (c:) previous) [[first]] rest
  where first = head list
        rest = tail list

permutateHelper
