getSumTuple :: [Int] -> ([Int],Int)
getSumTuple [] = ([], 0)
getSumTuple list = (list, sum list)


checkSumExists :: [([Int], Int)] -> Int-> Bool
checkSumExists [] x = False
checkSumExists (first:rest) x
  | snd first == x = True
  | otherwise = checkSumExists rest x


diffsums :: [[Int]] -> [[Int]]
diffsums = (map fst).(foldl foldFunction [])


foldFunction:: [([Int], Int)]-> [Int] ->[([Int], Int)]
foldFunction previous current =
  if checkSumExists previous currentSum
    then previous
    else (current,currentSum):previous
  where currentSum = sum current
