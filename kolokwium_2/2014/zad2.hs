is3 :: Int -> Maybe Int
is3 = is3Helper 1

is3Helper :: Int -> Int-> Maybe Int
is3Helper current target
    | current * current * current > target = Nothing
    | current * current * current == target = Just current
    | otherwise = is3Helper (current+1) target


c :: Maybe Int -> Int
c Nothing = 0
c (Just x) = 2*x +1

fun :: Int-> Int
fun = c.is3  
