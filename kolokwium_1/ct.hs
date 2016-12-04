data OP = Add | Mul | Neg
data CT a = Empty | Leaf a | Join (CT a) OP (CT a)


wf:: Num a => CT a -> Bool
wf Empty = False
wf (Leaf a) = True
wf (Join Empty Add right) = False
wf (Join left Add Empty) = False
wf (Join Empty Mul right) = False
wf (Join left Mul Empty) = False
wf (Join left Neg right) = False
wf (Join left Neg Empty) = wf left
wf (Join Empty Neg right) = wf right
wf (Join left op right) = (wf left) && (wf right)
