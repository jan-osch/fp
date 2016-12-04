data OP = Add | Mul | Neg
data CT a = Empty | Leaf a | Join (CT a) OP (CT a)


wf:: Num a => CT a -> Bool
wf Empty = False
wf (Leaf a) = True
wf (Join left Add right) = wf left && wf right
wf (Join left Mul right) = wf left && wf right
wf (Join left Neg right) = leftIsValid /= rightIsValid && (leftIsValid || rightIsValid)
  where leftIsValid = wf left
        rightIsValid = wf right


eval::Num a => CT a -> a
eval tree = if wf tree then evalHelper tree
  else error "Tree is not valid"

evalHelper::Num a => CT a -> a
evalHelper Empty = 0
evalHelper (Leaf a) = a
evalHelper (Join left Neg right) = negate (evalHelper(left) + evalHelper(right))
evalHelper (Join left Add right) = evalHelper(left) + evalHelper(right)
evalHelper (Join left Mul right) = evalHelper(left) * evalHelper(right)


-- (Join (Join (Leaf 3) Add (Leaf 2)) Mul (Join (Leaf 2) Neg (Leaf 3)))
