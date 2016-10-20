maxCons :: Eq a => [a] -> Integer
maxCons array = maxConsHelper array (array!!0) 0 0

maxConsHelper :: Eq a => [a] -> a -> Integer ->  Integer -> Integer
maxConsHelper [] previous result maxResult = max result maxResult
maxConsHelper (element:rest) previous result maxResult =
  if element == previous
    then maxConsHelper rest element (result+1) maxResult
    else maxConsHelper rest element 1 newResult
      where newResult = max result maxResult
