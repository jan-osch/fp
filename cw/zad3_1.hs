h "" = ""
h (s:st) = if s == 'a'
  then "ab" ++ rest
  else "ba" ++ rest
  where rest =  h(st)

h0 start n = take n $
  last $
  takeWhile (\l -> length(l) < 2*n) (iterate h start)
