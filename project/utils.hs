module Utilities where
import           Test.Hspec

data Matrix = Matrix (Int,Int) [Bool]

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


-- getSubMatrix :: Matrix -> (Int, Int) -> (Int, Int)-> Maybe Matrix
-- getSubMatrix (Matrix (x, y) array) (startX, startY) (sizeX, sizeY)
--   | x < startX + sizeX = Nothing
--   | y < startY + sizeY = Nothing
--   | otherwise = Just (Matrix (sizeX, sizeY) subMatrix)
--     where
--       rows = take sizeY $ drop startY array
--       subMatrix = map (take sizeX . drop startX) rows


-- mergeArrays::[Bool]->[Bool]->Maybe [Bool]
-- mergeArrays (x:first) (y:second)
matrix1 :: Matrix
matrix1 = Matrix (3,3) [True, False, True,
                        False, True, True,
                        False, False, False]
matrix2 :: Matrix
matrix2 = Matrix (2,2)[ True, True,
                        False, False]

main :: IO ()
main = hspec $ do
  describe "parse" $ do
     it "should parse a valid string"
       $ parseMatrix "XX\nOO" `shouldBe` Just matrix2
     it "should return nothing when string is invalid"
      $ parseMatrix "XXX\nO" `shouldBe` Nothing
  describe "show" $ do
    it "#1"
      $ show matrix1 `shouldBe` "XOX\nOXX\nOOO\n"
    it "#2"
      $ show matrix2 `shouldBe` "XX\nOO\n"
  describe "show + parse" $ do
    it "should return original matrix"
      $ parseMatrix (show matrix1) `shouldBe` Just matrix1
    it "should return original matrix #2"
      $ parseMatrix (show matrix2) `shouldBe` Just matrix2
