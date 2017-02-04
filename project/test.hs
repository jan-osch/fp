import Utilities
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
