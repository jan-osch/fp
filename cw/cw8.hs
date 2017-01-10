--DEFINICJE BEZKROPKOWE

--ZAD1
-- mamy liste
[('a', 1), ('b', -1), ('c', 4)]
--mamy napisac funkcje ktora wyszuje te dla ktorych liczba jest dodatnia
-- bezkropkowo
positiveSecond = (map fst).(filter ((>0).snd))


--ZAD2
-- jest lista
[True, False, True, False] -- ma zwrócić && dla wszystkich
ilog ::  [Bool] -> Bool
ilog  = foldl (&&) True


--ZAD3
--ma wypluć pomnożoną listę (razy 2)
rozw 2 [1,5,7] = [2,10,14]
rozw = map.(*)

--odwracanie argumentów
(flip rozw2) = map.(*)
rozw2 = flip $ map.(*)

--ZAD4
--funkcja
zadanko x y = 2 * x + 3 * y
zadanko x y = (+) (2 *x) ((3*) y)
zadanko x = ((+) (2 *x)).(3*)
zadanko = (.(3*)).((+).(2*))


--NUMOCC z 2014
numocc:: Eq a => a-> [[a]] ->[Int]
numocc x lista = map (numoccHelper x) lista
numocc = map.numoccHelper

numoccHelper 1 [1,2,3] = 1
numoccHelper x lista = length (filter (==x ) lista )
numoccHelper = (length.).(filter.(==)) -- dwie kropki


--ZADANIE BEDZIE NA KOLOKWIUM
rozw 'a' [1,2,3]  = [('a', 1), ('a', 2), ('a', 3)]
-- trzeba użyć zipa
rozw x lista = zip (repeat x) lista
rozw = zip.(repeat)

-- funkcja id bieże x i zwraca x
f =  id
f x = x

zipWith (==) [1,2,3] [3,2,1] = [False, True, False]


--ZADANIE 5
f [2,5,7,3,4]  = [2,7,4] -- parzyste bierze
f = (map (fst)).filter(\x -> snd x `mod` 2 == 0 ).(zip [0,1..])
