-- Mamy strukturę
data BTree a = Empty | Node (BTree a) a (BTree a)

showw x = putStr $ show x

-- ma znajdować maksymalną wartość
maxElem :: Ord a => BTree a -> a
maxElem Empty = error "Puste drzewo"
maxElem (Node left x Empty) = x
maxElem (Node Empty x right) = maxElem right


delete :: Ord a => BTree a -> a -> BTree a
delete Empty x = Empty
delete (Node Empty y Empty) x = Empty -- zakładamy że element istnieje
delete (Node t1 y t2) x
  | x == y = (Node ((delete t1) (maxElem t1)) (maxElem t1) t2)
  | x < y = (Node (delete t1) y t2)
  | x > y = (Node t1 y (delete t2))


-- FOLD = REDUCE :)
-- FOLDL i FOLDR
foldl :: (a->b->a) -> a ->[b]->a -- przyjmuje najpierw typ akumulatora
foldr :: (a->b->b) -> b ->[a]->b -- najpierw typ tablicy

-- Używamy tego
insert :: Ord a => a -> Btree a -> Btree a
insert x Puste = (Node x Puste Puste)
insert x (Node p left right) =
  if x < p then (Node p left (insert x right))
  else if x > p (Node p (insert x left) right)
  else (Node p left right) -- bez powtorzen

-- chcemy napisać funkcję która wkłada listę do drzew
buildTree :: Ord a => [a] -> BTree a
buildTree [] = Empty
buildTree (x:rest) = insert x (buildTree r)
--Alternatywnie: 2
buildTree2 lista = foldr insert Empty lista

--Odwrotny
buildTree3 lista = foldl (flip insert) Empty lista
-- flip zamienia kolejność argumentów
-- musimy go użyć bo foldl jako pierwszy argument przyjmuje typ a

suma x = foldl (+) 0 x
--można zapisać krócej
suma = foldl (+) 0
iloczyn  = foldl (*) 1

silnia  n = foldl (*) 1 [1..n]



-- SPŁASZCZANIE
[[1,2,3], [4,5,6], [7,8,9]]
-- ma być
[1,2,3,4,5,6,7,8,9]
myFold [] = []
myFold list = foldl (++) [] lista


--ZADANIE
[1,2,3,4] -- ma być [1*1 + 2*2 + 3*3 + 4*4]
mySquareSum = sum.(map(^2))

mySquareSum2 = foldl (\x y -> x+y^2) 0



--ZADANIE SORTOWANIE PRZEZ WSTAWIANIE
[5,4,2,3,1]
[5]
[4,5]
[2,4,5]
[2,3,4,5]
[1,2,3,4,5]

insertToList :: Ord a => [a] -> a-> [a]
insertToList [] y = [y]
insertToList (x:rest) y = if x < y then x : (insertToList rest x)
  else x:(y:rest)

insertSort :: Ord a => [a] -> [a]
insertSort = foldl insertToList []

--ZADANIE QUICK SORT
quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:r) = (quickSort([y | y <- r, y<x])) ++ [x] ++ (quickSort([y | y <- r, y >=x]))


--ZADANIE LISTA JAKO WIELOMIAN
 x^3 +2*x^2 -x +3
 --reprezentujemy  jako liste
[3,-1,2, 1]
--napisz funkcje ktora bierze taka liste i x i zwraca wartość funkcji
--możemy użyć jakiegoś wzoru hornera
((1*x + 2) * x -1) * x +3

value [] x = 0
value lista x = foldr (\cur prev -> prev * x + cur ) 0 lista
