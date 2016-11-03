pikaczu = (\x y -> if x > y then 5 else -3)
-- funkcja anonimowa w haskellu

--funkcja silnii
fs :: (Int->Int) ->(Int -> Int)
--tak naprawdę ta funkcja przyjmuje funkcję i wtedy zwraca funkcję
--która przyjmuje inta i zwraca inta
fs f n =
  if n == 0
    then 1
    else f(n-1) * n

silnia  = punktStaly fs

punktStaly :: (b->b) -> b
punktStaly m = m (punktStaly m)
-- punkt staly wynika z rekurencji

--rozwiniecie silnii
--silnia 3  = (punktStaly fs) * 3
-- =  (fs (punktStaly fs)) 3
-- = ((punktStaly fs) * 2) * 3
-- = (fs (punktStaly fs) 2) * 3
-- ... cd



--funkcja filter
--filter logiczna lista = zwraca nowa lista
filter (\x -> x>0) [1,-2,-3,4,5,6] = [1,4,5,6]

--funkcja map
map (\x -> x*x) [1,2,3,4,5] = [1,4,9,16,25]

--funkcja mnożenia
(*)::Int->(Int->Int)

(*) 2 :: Int -> Int --funkcja mnożaca przez 2

map ((*) 2) [1,2,3,4]
-- ten sam zapis
map (2 (*)) [1,2,3,4]

map (/2) [2,3,4] = [1,1.5,2]
map (2/) [1,2,4] = [2,1,0.5]
--definicje bezargumentowe / bezpunktowy



--złożenie funkcji p1.p2
--złożenie p1(p2(x))

--ZADANIE:
--napisz funkcje ktora bierze liste liczb calkowitych i zwraca pomnozone przez 2 liczby dodatnie
lyst = [1,3,-2,-4,5]

positive = filter (> 0) -- funkcja odfiltrowujaca negatywne
multiply = map (* 2) -- funkcja mapujaca --taki zapis skrócony - można też zapisać ładniej z argumentami
--  składanie funkcji
rozwiazanie = multiply.positive --złożenie


-- odwracanie funkcji
(flip f) x y = f y x
(< 0)   = flip(>) 0



map (*) [2,3,4] --zwraca listę funkcji -- [*2, *3, *4]

-- Zadanie domowe -może być
-- funkcja anonimowa robiaca kwadrata:
pow2 = (\x -> x* x ) -- nie da sie zapisać bezargumentowo
