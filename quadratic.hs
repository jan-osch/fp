getDetlaSquareRoots :: (Double, Double, Double) -> (Double, Double)

getDetlaSquareRoots (a,b,c) = ( ((-b) -sqrtDelta) / 2 * a, ((-b) + sqrtDelta) / 2*a )
  where sqrtDelta = sqrt (b * b - 4 * a *c)
