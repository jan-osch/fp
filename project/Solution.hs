module Solution where

import Matrix
import Control.Applicative ()


canBeBuilt :: Matrix ->XY-> [Matrix]->[Matrix]-> Bool
canBeBuilt m (x,y) prev [] = newY < sizeY && canBeBuilt m (newX, newY) [] prev
  where
    (Matrix (sizeX,sizeY) _) = m
    newX = if x+1> sizeX then 0 else x+1
    newY = if x+1> sizeX then y+1 else y

canBeBuilt m (x,y) previous (current:rest)
  | isMatrixFilled m = True
  | otherwise = complete || newOneCanBeBuild || canBeBuilt m (x,y) newPrevious rest
    where
      (Matrix size _) = m
      newMatrix = merge m (x,y) current
      complete =  maybe False isMatrixFilled newMatrix
      newOneCanBeBuild =  maybe False (\z -> canBeBuilt z (0,0) [] (previous++rest)) newMatrix
      newPrevious = if newOneCanBeBuild then previous else previous++[current]
