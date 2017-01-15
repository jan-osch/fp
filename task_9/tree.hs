import System.IO

data Tree a = Empty | Node (Tree a) a (Tree a)

instance Show a => Show (Tree a) where
  show = showHelper 0

showHelper :: Show a => Int -> Tree a  -> String
showHelper depth Empty  = ""
showHelper depth (Node left element right)  =
  showHelper deeper right  ++
  addPadding depth ++ show element ++ "\n" ++
  showHelper deeper left
  where
    deeper = depth +1
    addPadding :: Int -> String
    addPadding 0 = ""
    addPadding n = "  "++addPadding(n-1)

buildTree:: [(a, Int, Int)] -> Int -> Tree a
buildTree list 0  = Empty
buildTree list row =
  Node (leftSubtree) value (rightSubtree)
  where
    (value, leftRow, rightRow) = list !! (row -1)
    leftSubtree = buildTree list leftRow
    rightSubtree = buildTree list rightRow

serializeTree :: Tree a -> Int ->[(a, Int, Int)]
serializeTree Empty _  = []
serializeTree (Node leftSubtree value rightSubtree) currentRow =
  [(value, left, right)] ++ leftList ++ rightList

  where
    leftList = serializeTree leftSubtree (currentRow + 1)
    rightIndex = currentRow + 1 + length(leftList)
    rightList = serializeTree rightSubtree rightIndex

    left = if null leftList then 0 else currentRow + 1
    right = if null rightList then 0 else  currentRow + 1 + length (leftList)

nodeFromString :: String -> (Int, Int, Int)
nodeFromString line  = (a,b,c)
  where
    split = words line
    [a, b, c] = map parseInt split
    parseInt:: String -> Int
    parseInt x = read x :: Int

nodeToString :: (Int, Int, Int) -> String
nodeToString (a,b,c)  = show a ++ " " ++ show b ++ " " ++ show c

maxElem :: Ord a => Tree a -> a
maxElem Empty = error "Empty tree"
maxElem (Node _ x Empty) = x
maxElem (Node _ x right) = maxElem right

delete :: Ord a => Tree a -> a -> Tree a
delete Empty x = Empty
delete (Node Empty y right) x
  | x < y = error "Element is missing"
  | x > y = (Node Empty y (delete right x))
  | x == y = right
delete (Node left y right) x
  | x < y = (Node (delete left x) y right)
  | x > y = (Node left y (delete right x))
  | x == y = (Node leftWithoutMax maxFromLeft right)
  where
    maxFromLeft = maxElem left
    leftWithoutMax = delete left maxFromLeft

ftdel :: FilePath -> FilePath -> Int -> IO ()
ftdel fromPath toPath k = do
    handle <- openFile fromPath ReadMode
    contents <- hGetContents handle

    let parsed = map nodeFromString (lines contents)
        tree = buildTree parsed 1
        cleaned = delete tree k
        serialized = serializeTree cleaned 1

    putStr (show tree)
    putStrLn ("After removing: "++ show k)
    putStr (show cleaned)

    outputHandle  <- openFile toPath WriteMode
    mapM ((hPutStrLn outputHandle).(nodeToString))  serialized

    hClose handle
    hClose outputHandle

main = do
  ftdel "input.txt" "output.txt" 2
