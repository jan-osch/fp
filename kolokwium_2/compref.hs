compref:: Eq a => [a] -> [a] -> Int
compref [1,2,3,4,5] [1,2,3,0,2] = 3
compref "Ala ma kota" "Ala nie ma kota" = "Ala "

compref l1 l2 = length ( takeWhile (==True) ((zipWith (==) l1 l2)))


f = length
g = takeWhile (==True)
compref' l1 l2 = f ( g (zipWith (==) l1 l2 ))
compref'' l1 l2 = f   (   g   (   ((zipWith (==) l1) l2)   )   )
