myFmap :: [(a->a)] -> a -> [a]
myFmap list initial = map (\x -> fst x $ snd x) $ zip list (repeat initial)
myFmap' list = (map (\x -> fst x $ snd x)) . (zip list). (repeat)
myFmap'' list = (map (g)) . (zip list). (repeat)

g x = fst x $ snd x
g' = uncurry ($)

myFmap''' list = (map (g')) . (zip list). (repeat)
myFmap''' list = (map (g')) . ((. repeat) .(zip )) list
myFmap'''' = (map (g') .) . ((. repeat) . (zip))

fmap :: [(a->a)] -> a -> [a]
fmap = myFmap
