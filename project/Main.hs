import System.IO
import Control.Applicative ()
import Matrix
import Solution
import Data.Maybe
import System.Environment

start :: FilePath -> IO ()
start fromPath = do
    handle <- openFile fromPath ReadMode
    contents <- hGetContents handle

    let separated = lines contents
        count = read (head separated) ::Int
        actual = fromMaybe [] $ readMatrix count $ tail separated
        subject = head actual
        set = tail actual

    putStrLn "Subject Poliomina:"
    print subject
    putStrLn "Loaded Poliomina:"

    mapM print set

    let result = canBeBuilt subject (0,0) [] set
    putStrLn $ "Can be built:  " ++ show result

    hClose handle

readMatrix :: Int -> [String] -> Maybe [Matrix]
readMatrix 0 _ = Just []
readMatrix toGo (first:rest) =
  case parsed of
    Nothing -> Nothing
    Just m  -> (\x -> m:x ) <$> restParsed
  where
    rows = read first ::Int
    parsed = parseMatrix $ unlines $ take rows rest
    newRest = drop rows rest
    restParsed = readMatrix (toGo-1) newRest

main :: IO ()
main = do
  args <- getArgs
  start $ head args
