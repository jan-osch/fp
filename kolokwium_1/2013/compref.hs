compref :: Eq a => [a] -> [a] -> Int
compref =  curry $ length . takeWhile (testEquality) . (uncurry $ zip)

testEquality :: Eq a => (a,a) -> Bool
testEquality = uncurry (==)
