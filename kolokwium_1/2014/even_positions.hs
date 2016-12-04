evenPositions :: [a] -> [a]
evenPositions = map snd . filter checkIndexIsEven  . (zip [0,1..])


checkIndexIsEven :: (Int,a) -> Bool
checkIndexIsEven =  (==0).(flip(mod) 2). fst
