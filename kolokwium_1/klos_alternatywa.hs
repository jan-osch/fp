data Klos a = K [a] [a]

wnpk :: Klos a -> a -> Klos a
wnpk (K begin end) element = K (element:begin) end

wnkk :: Klos a -> a -> Klos a
wnkk (K begin end) element = K begin (element:end)

k2list :: Klos a -> [a]
k2list (K begin end) = begin ++ reverse(end)
