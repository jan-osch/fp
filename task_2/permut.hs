--Main function
permutation 1 = [[1]]
permutation x = foldl (foldPermutating x) [] previous
  where previous = permutation (x-1)

--Helper function
foldPermutating number previous element = previous ++ permutate number element

permutate number array = permutateHelper number (number-1) array

permutateHelper number position array = if position == 0
  then [insert number position array]
  else insert number position array : permutateHelper number newPosition array
  where newPosition = position -1

insert number postition array = take postition array  ++ number : drop postition array
