numocc:: Eq a => a-> [[a]] ->[Integer]
numocc element [] = [0]
numocc element list = map (numoccHelper element) list

numoccHelper:: Eq a => a -> [a] -> Integer
numoccHelper element [] = 0
numoccHelper element (first:rest) =
  if first == element
    then 1 + resultRest
    else 0 + resultRest
  where resultRest = numoccHelper element rest

numocc2:: Eq a => a-> [[a]] ->[Int]
numocc2 a list = map (filter ((==) a)) list
