data BTree a = Empty | Node (BTree a) a (BTree a)

instance Show a => Show (BTree a) where
  show = showHelper 0

showHelper :: Show a => Int -> BTree a  -> String
showHelper depth Empty  = ""
showHelper depth (Node left element right)  =
  showHelper deeper right  ++
  addPadding depth ++ show element ++ "\n" ++
  showHelper deeper left
  where deeper = depth +1


addPadding :: Int -> String
addPadding 0 = ""
addPadding n = "  "++addPadding(n-1)

--Struktura do testowania
x = Node (Node (Node Empty 2 Empty) 4 (Node (Node Empty 7 Empty) 1 (Node Empty 8 Empty))) 3 (Node (Node Empty 6 (Node Empty 0 Empty)) 5 Empty)
