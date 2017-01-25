f lista = foldr g 1 lista
f' = foldr g 1

g x acc = x + 1/ acc
g' x acc =  (+) x (1/acc)
g'' x acc =  (+) x ((1/) acc)
g'' x  =  ((+) x).(1/)
g''' x  =  flip (.) (1/) ((+) x)
g'''' x  =  (flip (.) (1/)).(+) x
g''''' =  (flip (.) (1/)).(+)
