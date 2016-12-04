change :: [Char] -> [Char]
change [] = []
change [x] = [x]
change ('a':'b':rest) = 'a' : change rest
change ('b':'a':rest) = 'b' : change rest
change ('b':'b':rest) = 'a' : change rest
change ('a':'a':rest) = "aaa" ++ change rest


dlugosc napis = length $ takeWhile (not.isAOrSmaller) (iterate change napis)
  where isAOrSmaller x = length x < 2 || all (=='a') x
