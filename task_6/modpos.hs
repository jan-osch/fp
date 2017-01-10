modpos :: Int -> [a] -> [a]
-- modpos divisor list = map snd $ filter (\pair -> fst pair `mod` divisor == 0) (zip [0,1..] list)
-- modpos divisor = (map snd).((filter (\pair -> fst pair `mod` divisor == 0)).(zip [0,1..]))
modpos divisor = (map snd).( ( filter ((0 ==).(`mod` divisor).(fst)) ).(zip [0,1..])) -- niestety utknąłem tutaj

madposZa1Pkt = madpos 2
