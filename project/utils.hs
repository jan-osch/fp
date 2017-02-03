module Utilities where
import           Test.Hspec

data Matrix = Matrix (Int,Int) [[Bool]]

instance Eq Matrix where
  (==) (Matrix (x,y) first) (Matrix (x2,y2) second) = x==x2 && y==y2 && arraysAreEqual
    where
      arraysAreEqual = foldr (\cu prev -> uncurry (==) cu && prev) True $ zip first second

instance Show Matrix where
  show (Matrix (x,y) array ) = show (x,y) ++ "\n" ++ unlines strings
    where
      strings = map mapping array
      mapping = map (\z -> if z then 'X' else 'O')

getSubMatrix :: Matrix -> (Int, Int) -> (Int, Int)-> Maybe Matrix
getSubMatrix (Matrix (x, y) array) (startX, startY) (sizeX, sizeY)
  | x < startX + sizeX = Nothing
  | y < startY + sizeY = Nothing
  | otherwise = Just (Matrix (sizeX, sizeY) subMatrix)
    where
      rows = take sizeY $ drop startY array
      subMatrix = map (take sizeX . drop startX) rows


main :: IO ()
main = hspec $
  describe "justify" $ do
    it "getSubMatrix"
      $ getSubMatrix matrix1 (1,1) (2,2) `shouldBe` Just matrix2
    it "show"
      $ show matrix1 `shouldBe` "(3,3)\nXOX\nOXX\nOOO\n"

  where
    matrix1 = Matrix (3,3) [
                            [True, False, True],
                            [False, True, True],
                            [False, False, False]]
    matrix2 = Matrix (2,2)[
                            [True, True],
                            [False, False]]
