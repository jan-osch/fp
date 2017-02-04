import           Data.Maybe
import           Matrix
import           Solution
import           Test.Hspec

matrix1 :: Matrix
matrix1 = Matrix (3,3) [True, False, True,
                        False, True, True,
                        False, False, False]
matrix2 :: Matrix
matrix2 = Matrix (2,2)[ True, True,
                        False, False]

matrix3 :: Matrix
matrix3 = Matrix (1,2)[ True,
                        True]

matrix4 ::Matrix
matrix4 = fromJust $ parseMatrix "XO\nXO\n"

subject1 :: Matrix
subject1 = fromJust $ parseMatrix "OO\nOO\n"

set1 ::[Matrix]
set1 = [fromJust $ parseMatrix "X", fromJust $ parseMatrix "OX\nXX"]

main :: IO ()
main = hspec $ do
  describe "parse" $ do
     it "should parse a valid string"
       $ parseMatrix "XX\nOO" `shouldBe` Just matrix2
     it "should return nothing when string is invalid"
      $ parseMatrix "XXX\nO" `shouldBe` Nothing
     it "should parse a bigger matrix from string"
      $ maybe "" show (parseMatrix "XXXOX\nXXOOX\nXOOOX\nOOOOX\n") `shouldBe` "XXXOX\nXXOOX\nXOOOX\nOOOOX\n"

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

  describe "prepareArray" $ do
    it "should return padded array for when inserting 3 into 1 #1"
      $ prepareArray matrix1 (1,1) matrix3 `shouldBe` [False, False,False,
                                                      False, True, False,
                                                      False, True, False]
    it "should return padded array for when inserting 3 into 1 #2"
      $ prepareArray matrix1 (0,0) matrix3 `shouldBe` [True, False,False,
                                                      True, False, False]
    it "should return padded array for when inserting 3 into 1 #3"
      $ prepareArray matrix1 (2,1) matrix3 `shouldBe` [False, False,False,
                                                      False, False, True,
                                                      False, False, True]

  describe "merge" $ do
    it "should return nothing when inserting bigger into smaller"
      $ merge matrix3 (0,0) matrix1 `shouldBe` Nothing
    it "should return nothing when inserting smaller into bigger but outside"
      $ merge matrix1 (3,0) matrix3 `shouldBe` Nothing
    it "should return nothing when the same into the same on 0,0 position"
      $ merge matrix1 (0,0) matrix1 `shouldBe` Nothing
    it "should return a new valid matrix when the they both fit"
      $ fmap show (merge matrix1 (0,1) matrix3) `shouldBe` Just "XOX\nXXX\nXOO\n"

    it "should return a new valid matrix #1"
      $ merge subject1 (1,0) matrix3 `shouldBe` Just (Matrix (2,2) [False,True,False, True])
    it "should return a new valid matrix #2"
      $ merge subject1 (0,0) matrix3 `shouldBe` Just (Matrix (2,2) [True,False, True, False])
    it "should return a new valid matrix #3"
      $ merge matrix4 (1,0) matrix3 `shouldBe` Just (Matrix (2,2) [True, True, True, True])
    it "should return a new valid matrix #3"
      $ merge (Matrix (4,2) [True,True, True, True, True, True, False, False]) (2,1) (Matrix (2,1) [True, True]) `shouldBe` Just (Matrix (4,2) [True,True, True, True, True, True, True, True])

  describe "isMatrixFilled" $ do
    it "should return true for a filled matrix"
      $ isMatrixFilled matrix3 `shouldBe` True
    it "should return false for a matrix with empty spots"
      $ isMatrixFilled matrix1 `shouldBe` False

  describe "canBeBuilt" $ do
    it "should be able to connet two elements"
      $ canBeBuilt subject1 (0,0) [] set1 `shouldBe` True
    it "should be able to connet two elements, vertical"
      $ canBeBuilt subject1 (0,0) [] [matrix3, matrix3] `shouldBe` True
