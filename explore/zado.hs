
f lista = foldr g 1.0 lista

-- f :: [Int] -> Double
-- f = foldr g 1

-- g x reszta = x + 1/reszta
-- --g x reszta = (+) x 1/reszta
-- --g x reszta = ((+) x (1/) reszta)
-- --g x reszta = ( (+) x).(1/) reszta
-- --g x = ( (+) x).(1/)
-- -- g x = flip(.) (1/) ((+) x)
-- -- g x = (flip(.) (1/)).(+) x
g = (flip(.) (1.0 /)).(+)
