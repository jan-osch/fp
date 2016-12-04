diffNums :: [[Integer]] -> [[Integer]]
diffNums list = foldl foldingFunction [] list

foldingFunction :: [[Integer]] -> [Integer] -> [[Integer]]
foldingFunction previous current = if existsInPrevious
  then previous
  else  previous ++ [current]
  where currentSum = foldl (+) 0 current
        existsInPrevious = foldl (sumExists currentSum) False previous

sumExists :: Integer -> Bool -> [Integer] -> Bool
sumExists n True list = True
sumExists n False list = (foldl (+) 0 list) == n
