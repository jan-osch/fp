pownumHelper:: Int-> Int -> Int
pownumHelper n x
  | x > 10 =  powered + pownumHelper n (x `div` 10)
  | otherwise = powered
    where powered = (x `mod` 10) ^ n

pownum :: Int -> [Int]
pownum n = [x | x <- [1..], x == pownumHelper n x ]
