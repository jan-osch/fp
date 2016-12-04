buildPermutation :: Integer ->[Integer]->[[Integer]] -> [[Integer]]
buildPermutation 0 current previous = previous ++ [current]
buildPermutation n current previous =
  buildPermutation (n-1) nextOne newResult
  where newResult = buildPermutation (n-1) nextZero previous
        nextZero = 0:current
        nextOne = 1:current

permut :: Integer -> [[Integer]]
permut n
    | n < 0 = error "n has to be higher than zero"
    | n == 0 = []
    | otherwise = buildPermutation n [] []

sumIsOdd :: [Integer] -> Bool
sumIsOdd list = s `mod` 2 /= 0
  where s = foldl (+) 0 list

oddBins n = [x | x <- (permut n), sumIsOdd x ]
