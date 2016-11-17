--ALIASY
type MyString = [Char]
-- alias typu
-- można zapisać wszędzie tam gdzie można zapisane jest [Char]


--NOWE TYPY
newtype X = [Int] -- nowy typ który
-- jego nie można zastąpić [Int]
f:: X -> X


--PRAWDZIWE TYPY
data Naturalne = Zero | Nast Naturalne
-- po kolei występują konstruktuory elementów
-- pierwszy element: Zero - bez argumentowy konstruktor
-- drugi element: Nast Naturalne - jedno argumentowy konstruktor(przyjmuje typ Naturalne)
Zero:: Naturalne
Nast Zero :: Naturalne

x = Nast(Nast(Zero)) -- to jest 2

g Zero = 0
g (Nast x) = g(x) + 1


--INTERFEJSY
-- np żeby można było porównywać musi spełniać Eq
-- (==) ~~~> Eq
data Naturalne = Zero | Nast Naturalne deriving Eq
-- dodaje "automatycznie" wsparcie dla operacji ==
-- porównywane są sposoby tworzenia konstruktorów
Zero == Zero
Zero != Nast _
Nast x == Nast y -- wtedy gdy x == y


--ALTERNATYWNY ZAPIS
-- Definiuje operacje z interfejsu Eq dla typu Naturalne
instance Eq Naturalne where
  (==) Zero Zero = True
  (==) Zero x = False
  (==) x Zero = False
  (==) Nast(x) Nast(y) = x==y


--ORD - POZWALA PORÓWNYWAĆ
instance Ord Natuarlne where
  (<=) Zero Zero = True
  (<=) Nast(_) Zero = False
  (<=) Zero Nast(_) = False
  (<=) Nast(x) Nast(y) = x <= y

-- teoretycznie trzebaby zdefiniować 4 przypadki
(<=)
(<)
(>=)
(>)
--ale tak naprawdę trzeba zdefiniować >>>>jedną<<< bo:
(<) x y = not((>=) x y)
(>) x y = not((<=) x y)
(>=) x y = not((<) x y)
(>) x y = not((<=) x y)



--DEFINICJA LISTY NA DATA
data [a] = [] | (:) a [a] -- nie kompiluje się
((:) a b) = (a : b) -- zapis oznacza kontynuacja listy

data Lista a = Pusta | Dodaj a Lista
-- parametryzowany data type

instance Eq (Lista a) where
  (==) Pusta Pusta = True
  (==) Dodaj x list Pusta = False
  (==) Pusta Dodaj x list = False
  (==) (Dodaj x (first)) (Dodaj y (second)) = (x == y)  && ((==) l1 l2)
  --tutaj potrzebujemy mieć operację x == y ~~~ DLATEGO: musimy zapisać nagłowek

instance Eq a => Eq (Lista a) where
  (...)


--INTERFEJSY -> JAKIE FUNKCJE TRZEBA ZDEFINIOWAĆ
Eq  -> (==)
Ord -> (>=),(<),(>),(<=)
Num -> (+), (-), (*), abs, signum, negate
Show -> show

toInt Zero = 0
toInt (Nast x) = 1 + toInt(x)

instance Show Naturalne where
  show (Nast x) = show (toInt (Nast x))


--LICZBY CALKOWITE
data Calkowite = Zero | Poprzedni Calkowite | Nast Calkowite
data Calkowite = Dodatnie Naturalne | Ujemne Naturalne -- Korzystamy z tego co już mamy zrobione

toInt :: Calkowite -> Int
toInt Zero = 0
toInt (Nast x) = 1 + toInt(x)
toInt (Poprzedni x) = toInt(x) -1

fromInt :: Int -> Calkowite
fromInt 0 = Zero
fromInt x = if (x > 0) then Nast(fromInt(x -1))
  else Poprzedni(fromInt(x+1))



--DRZEWO BINARNE
data BTree a = Empty | Node a (BTree a) (Btree a) --drzewo binarne przechowujace dame typu a

size :: BTree a-> Int
size Puste = 0
size (Node a left right) = 1 + (size left) + (size right)

preorder :: Btree a -> [a]
preorder Puste = []
preorder (Node a left right) = a:(preorder left)++(preorder right)

insert :: Ord a => a -> Btree a -> Btree a
insert x Puste = (Node x Puste Puste)
insert x (Node p left right) =
  if x < p then (Node p left (insert x right))
  else if x > p (Node p (insert x left) right)
  else (Node p left right) -- bez powtorzen

--ZADANIE DOMOWE : NOWE : SHOW

--ZADANIE DOMOWE POPRZEDNIE:
-- NWW Z DLUGOSCI CYKLI
-- zrob funkcje ktora zwraca funkcje robiaca zamiany

g [3,4,5,2,1] = f
f 1 = 3
f 2 = 4
f 3 = 5
f 4 = 2
f 5 = 1
