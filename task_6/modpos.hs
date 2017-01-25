modpos :: Int -> [a] -> [a]
modpos divisor list = map snd ( filter (\pair -> fst pair `mod` divisor == 0) (zip [0,1..] list))
modpos' divisor = (map snd).(filter (\pair -> fst pair `mod` divisor == 0)).(zip [0,1..])
modpos'' divisor = (map snd).(flip (.) (zip [0,1..]) (filter (\pair -> fst pair `mod` divisor == 0)))
modpos''' divisor = (map snd).(flip (.) (zip [0,1..]) (filter (  (0==).(`mod` divisor ).(fst) )))
modpos'''' divisor = (map snd).(flip (.) (zip [0,1..]) (filter (  (0==).(flip (.) (fst) ((flip mod) divisor )))))
modpos''''' divisor = (map snd).( (.(zip [0,1..])) (filter (  (0==).((.(fst)).(flip mod)) divisor)))

f = map snd
g = (.(zip [0,1..]))
h = ((.(fst)).(flip mod))
modpos'''''' divisor = f.( g ( filter ((0==).h divisor) ))

modpos''''''' divisor = f.( g (((filter).((0==).h)) divisor) ))
