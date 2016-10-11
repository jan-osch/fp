fibonacci :: Integer -> Integer

fibonacci 0 = 1
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)


--Example
firstFibNumbers = [fibonacci x | x <- [0,1..20]]
