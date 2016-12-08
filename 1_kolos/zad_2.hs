ps :: [a] -> [[a]]
ps list = createPrefixes list ++ tail (createSuffixes list)

createSuffixes  :: [a] -> [[a]]
createSuffixes list = foldl psHelper [] (reverse list)

createPrefixes  :: [a] -> [[a]]
createPrefixes list = reverse $ map  reverse (foldl psHelper [] list)

psHelper:: [[a]] -> a -> [[a]]
psHelper list current = if length list > 0
  then (current :head list):list
  else [[current]]
