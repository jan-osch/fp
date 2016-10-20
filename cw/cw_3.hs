-- Tablice i tak dalej

-- :e edit - uruchamia w edytorze
-- :t <nazdeklaracja typów
-- :l <nazwa>

listaOdJedenDoSto = [1..100]

lystaKwadratow = [x*x | x<- [1..100] ]
-- pipe oznacza kierunek pipe

lystaPrzez7 = [x  | x<- [1..100], divisible 7 x ]
-- lista liczb od 1 do 100 które dziela sie przez 7

divisible a x = x `mod` a == 0


--trojkaty pitagorejskie
triangles :: Integer -> [(Integer, Integer, Integer)]
triangles n = if n < 0
   then error "Not allowed"
   else [(x,y,z) | x <- [1..n], y <- [1..n], z <- [1..n], x<y, x*x + y*y == z*z ]

--szybciej
trianglesFaster n = if n < 0
  then error "Not allowed"
  else [(x,y,z) | x <- [1..n], y <- [(x+1)..n], z <- [(y+1)..n], x*x + y*y == z*z ]
--przyspiesza tutaj bo nie iterujemy od 1 w przypadku y i z


-- take i drop
ta =  take 4 "Ala ma kota"  -- tk1 = "Ala "
dr = drop 2 "Ala ma kota" -- dr = "a ma kota"


--permutacje
perm 2 = [[1,2], [2,1]]
--perm 3 musimy wstawić 3 do tych wszystkich miejsc
-- [wstaw 3 p ] p <- [[1,2], [2,1]]

-- wstaw :: Integer -> [Integer] -> []
-- wstaw n tablica =
-- perm 1 = [[1]]
-- zrob wstaw na take i drop



--listy nieskonczone
sas= [1,2..]

-- nieskonczonyFib = [fibonacci x | x <- [1,2..]]

dodawanie [] l2  = []
dodawanie l1 [] = []
dodawanie (e:rest) (e2:rest2) = (e+e2) : dodawanie rest rest2

fib = 0:1: (dodawanie fib (tail fib)) -- tutaj fib to dotychczas policzone
--rekurencyjna definicja fibonacciego


pierwsze 2 = [2]
pierwsze n = [p | p <-[2..n], jestPierwsza p ]

jestPierwsza n = [d | d <-[2..(n-1)], n `mod`d == 0] == []
--takeWhile można użyć aby przyspieszyć


jestPierwsza2 n dzielniki = [d | d <-dzielniki, n `mod`d == 0] == []
-- można użyć any
