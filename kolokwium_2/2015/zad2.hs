g:: Monad m => (a->b-> m a) -> a -> [b] -> m a
g _ initial [] = return initial
g function current (first:rest) =
  function current first >>= \applied -> g function applied rest
