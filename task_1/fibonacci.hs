fibonacci :: Integer -> Integer

--Wolna wersja
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

--Helper
fibHelper 0 = [1]
fibHelper 1 = [1,1]
fibHelper x = current:previous
  where previous = fibHelper (x-1)
        current = previous !! 0 + previous !! 1

--Szybka wersja
fib2 x = (fibHelper x) !! 0
