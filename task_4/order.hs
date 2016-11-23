
order :: [Int]-> Int
order list = length (listOfPermutations) + 1
  where sigma = createSigma list
        applyFun = map sigma
        checkAreDifferent = listsAreDifferent list
        listOfPermutations = takeWhile checkAreDifferent $ tail $ iterate applyFun list

createSigma::[Int] -> Int -> Int
createSigma list x = list!!(x-1)

listsAreDifferent :: [Int] -> [Int] -> Bool
listsAreDifferent (x:tailFirst) (y: tailSecond) = (x /= y) || (listsAreDifferent tailFirst tailSecond)
listsAreDifferent [] [] = False
listsAreDifferent [] x = True
listsAreDifferent x [] = True
