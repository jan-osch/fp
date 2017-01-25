f:: [Int] -> [[Int]]
f = reverse . map reverse . foldl foldingFunction []

foldingFunction :: [[Int]] -> Int -> [[Int]]
foldingFunction [] current = [[current]]
foldingFunction listOfLists current =
  if (firstElem +1) == current
    then (current:firstList) : tail listOfLists
    else [current] : listOfLists

  where firstList = head listOfLists
        firstElem = head firstList
