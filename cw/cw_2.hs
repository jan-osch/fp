firstElem = head [1,2,3,4] -- should be 1
lastElem = tail [1,2,3,4] -- should be 4

-- typ :: [a] -> a
-- typ generyczny zwraca typ a

-- tworzenie range
-- [1..10] - od 1 do 10
-- ['b'..'f'] - literki po kolei
-- [1,4..10]
-- [10,9..1] -range malejacy

-- lista nieskończona
neverEndingStory = [1,2..]

-- jak sprawdzić czy jest dany element na danej liście
czyJest [1,2,3] 1 = True
czyJest [1,2,3] 5 = False
czyJest [] x = False
czyJest (element:reszta) x = if x == element then True
  else czyJest reszta x


liczbaWystapien [] x = 0
liczbaWystapien (element:reszta) x = if x == element
  then 1 + countInRest
  else countInRest
  where countInRest = liczbaWystapien reszta x

reverseList [] = []
reverseList (elem:reszta) = reverseList reszta ++ [elem] -- wolne bo dodawanie przez  ++

help [] l = l
help (el:reszta) wynik = help reszta (el:wynik) -- przerzuca w szybki sposób z jednej tablicy do drugiej

rev2 [] = []
rev2 lista = help lista [] -- dużo szybsze odwracanie


-- można porównywać listy o różnej długości elementów
-- [1,2,3] < [1,2,3] -- False
-- [1,2,3] < [1,2,3,4] -- True - jak się skończył lewy to prawy jest większy

everyTest war [] = []
everyTest test (el:rest) = if test el
  then el : result
  else result
  where result = everyTest test rest

divisibleByA a x = x `mod` a == 0


wyw = everyTest (divisibleByA 7) [1..100] -- wywołanie z argumentem 7


--[1,2,3,4,5] = 1-2+3-4+5
parami (x:y:reszta) = x - y + parami reszta
parami [x] = x


{-

odpal :set +s aby mierzyć czas wykonania wszys tkiego
-}
