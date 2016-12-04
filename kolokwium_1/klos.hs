data Klos a = Empty | Begin a (Klos a) | End a (Klos a)

wnpk :: Klos a -> a -> Klos a
wnpk previous element = Begin element previous

wnkk :: Klos a -> a -> Klos a
wnkk previous element = End element previous

k2list :: Klos a -> [a]
k2list Empty = []
k2list (Begin element previous) = element : k2list(previous)
k2list (End element previous) = k2list(previous) ++ [element]
