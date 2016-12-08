data Rd a = Empty | Node a [Rd a]

el :: Eq a => Rd a -> a -> Bool
el Empty x = False
el (Node y children) x
  | x ==y = True
  | otherwise = any (flip (el) x) children

subst ::Eq a => a -> a -> Rd a -> Rd a
subst  x y Empty= Empty
subst  x y (Node z children) =
  if z ==x then (Node y subChildren)
  else (Node z subChildren)
    where subChildren = map (subst x y) children

rd2list :: Rd a -> [a]
rd2list Empty = []
rd2list (Node x children) = x:foldl (++) [] (map rd2list children)



{--
TEST

el (Node 1 [Node 2 []]) 2 --True
el (Node 1 [Node 2 []]) 3 --False

el (Node 4 [Node 3 [], Node 1 []]) 2 --False
el (subst 1 2 (Node 4 [(Node 3 []), (Node 1 [])])) 2 --True

rd2list (Node 4 [Node 3 [], Node 1 []]) --4 3 1
rd2list Empty --[]
rd2list (Node 1 [Node 2 [Node 3 [], Node 4[]], Node 5 []]) --[1,2,3,4,5]
rd2list (Node 1 [Node 2 [Node 3 [], Node 4[Empty]], Node 5 []]) --[1,2,3,4,5]
--}
