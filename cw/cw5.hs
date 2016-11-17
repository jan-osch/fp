f x y = x/y

--  Jak chcesz funkcje użyć co ma notacje f a b
a `f` b -- tak to można zapisać

-- Jeżeli chcesz użyć funkcji która jest infiksowej jako prefiksow
(*) a b


-- zapis
(++) a = a+1
-- oznacza definicje funkcji ++
-- wywołujemy
b = (++) 2
-- b = 3


-- iterate
iterate f x = [x, f(x), f(f(x)) ...] -- komentarz


--ZADANIE 1.1
-- ciag
-- x(0) = 1
-- x(n+1) = 1/2(x(n) + g/x(n))   ---> można udowodnic ze to sqrt(g)
-- prosze użyc iterate

makeNext g x = (x + g/x) / 2  --funkcja ktora produkuje nastepny element

przyblizenia g xZero = iterate (makeNext g) xZero

-- KONTYNUACJA 1.2
-- Znajdz taki element ciagu przyblizenia delta od poprzedniego jest mniejsza niz d

-- pomysl
sprawdzDelte d x y = abs(a-y) =< d
-- musielibysmy przekonwertowac przyblizenia tak aby [(x0, x1), (x1, x2), (x2, x3)...]
--uzyjemy zip i tail
--CO TO ZIP?
zipPrim [] [] = []
zipPrim (x:xr) (y:yr) =(x,y) zipPrim xr yr

pierwiastek g x0 d = snd (last (listaParSpelniajacych))
  where przyb = przyblizenia g x0
        listaPar = zip przyb (tail przyb)
        listaParSpelniajacych = takeWhile (sprawdzDelte d) listaPar

-- syntax
pierwiastek g x0 d = snd (last (listaParSpelniajacych))
-- mozna zpisac
pierwiastek g x0 d = snd $ last $ listaParSpelniajacych

--rozwiazanie w pliku obok


-- ZADANIE 2.1
kwadrat x = x * x
para :: a - > (a,a)
para x = (x,x)

kwadrat = fst para * snd para


{-
CURRY I UNCURRY!!!!!!
//////////////        DIABEŁ        //////////////
//////////////        DIABEŁ        //////////////
//////////////        DIABEŁ        //////////////
-}
(*) x y = x *y
-- VVVV UNCURRY
(x,y) = x * y
-- VVVV CURRY
(*) x y = x *y
-- VVVV UNCURRY
(x,y) = x * y
--etc

uncurryPrim ::  (a -> b -> c) -> ((a,b) -> c)
--bieze funkcje co przyjmuje dwa argumenty  -zwraca funkcje co przyjmuje jeden argument (parę)

curryPrim ::  ((a,b) -> c) -> (a -> b -> c)
-- bieze funkcje ktora przyjmue jedna pare i zwraca funkcje ktora przyjmuje 2 osobne argumenty



--ZADANIE 3.1
-- ( ͡° ͜ʖ ͡°)
-- Abba i Stringi :P

hPrim "a" = "ab"
hPrim "ab" = "abba"
hPrim "abba" = "abbabaab"

h (s:st) = if s == 'a'
  then "ab" ++ rest
  else "ba" ++ rest
  where rest =  h(st)

h0 start n = take n $ last $ takeWhile (\l -> length(l) < 2*n) h start   
