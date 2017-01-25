zipM:: Monad m => [m a] -> [m b] -> m [(a,b)]
zipM [] list = return []
zipM list [] = return []
zipM (hFirst:tFirst) (hSecond:tSecond) = do
  rest <- zipM tFirst tSecond
  headUnpacked <- unpack hFirst hSecond
  return (headUnpacked : rest)

unpack ::Monad m => m a -> m b -> m (a,b)
unpack first second = do
  fi <- first
  se <- second
  return (fi, se)
