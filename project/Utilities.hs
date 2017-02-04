module Utilities where
import           Control.Applicative ()

type XY = (Int,Int)
data Matrix = Matrix XY [Bool]

instance Eq Matrix where
  (==) (Matrix (x,y) first) (Matrix (x2,y2) second) = x==x2 && y==y2 && arraysAreEqual
    where
      arraysAreEqual = foldr (\cu prev -> uncurry (==) cu && prev) True $ zip first second

instance Show Matrix where
  show (Matrix (x,_) array ) = unlines $ showHelper x array

showHelper:: Int -> [Bool]-> [String]
showHelper _ [] = []
showHelper x list = chars : showHelper x (drop x list)
  where
    chars = map (\z -> if z then 'X' else 'O') $ take x list

parseMatrix::String->Maybe Matrix
parseMatrix str = if sizeIsValid
  then Just (Matrix (rows, columns) array)
  else Nothing
  where
    separated = lines str
    mapped = map (map (== 'X')) separated
    sizes = map length mapped
    columns = head sizes
    rows = length mapped
    validRows =  length $ takeWhile (==columns) sizes
    sizeIsValid = validRows == rows
    array = concat mapped

merge::Matrix ->XY-> Matrix -> Maybe Matrix
merge (Matrix (x1,y1) array) (x,y) (Matrix (x2,y2) array2)
  | x1 < x+x2 = Nothing
  | y1 < y+y2 = Nothing
  | otherwise = Matrix (x1,x2) <$> merged
    where
      prepared = prepareArray (Matrix (x1,y1) array) (x,y) (Matrix (x2,y2) array2)
      merged = mergeArrays array prepared

prepareArray :: Matrix ->XY-> Matrix ->[Bool]
prepareArray (Matrix (x1,_) _) (x,y) (Matrix (x2,_) array2) = concat (emptyRows ++ paddedLeftAndRight)
  where
    emptyRows = replicate y $ falses x1
    separated = splitArray x2 array2
    emptyAfter = x1 - (x+x2)
    paddedLeftAndRight = map (\row -> falses x ++ row ++ falses emptyAfter ) separated

falses :: Int -> [Bool]
falses s = replicate s False

splitArray:: Int -> [Bool]-> [[Bool]]
splitArray _ [] = []
splitArray x list = current : splitArray x (drop x list)
  where
    current = take x list

mergeArrays:: [Bool]->[Bool] ->Maybe [Bool]
mergeArrays (True:first) (False:second) = (\x -> True:x) <$> mergeArrays first second
mergeArrays (False:first) (True:second) = (\x -> True:x) <$> mergeArrays first second
mergeArrays (False:first) (False:second) = (\x -> False:x) <$> mergeArrays first second
mergeArrays (True:_) (True:_) = Nothing
mergeArrays array [] = Just array
mergeArrays [] _ = Nothing
