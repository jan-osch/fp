val :: Integer -> Integer -> Integer
val referece y = if length powersThatDivide > 0
  then last powersThatDivide
  else 0
  where powersSmaller = takeWhile (<= referece) []
        powersThatDivide = [x | x<- powersSmaller, referece `mod` x == 0 ]
