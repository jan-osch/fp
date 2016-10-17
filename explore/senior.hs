data Membership = Open | Senior deriving (Eq, Show)

openOrSenior :: [(Int, Int)] -> [Membership]
openOrSenior [] = []
openOrSenior ((age, handicap):rest) =
  if age >= 55 && handicap > 7 then Senior: openOrSenior rest
  else Open : openOrSenior rest
