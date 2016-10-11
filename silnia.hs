computeFactorial :: Integer -> Integer

computeFactorial 0 = 1
computeFactorial x = if x< 0 then -1 else x * computeFactorial(x-1)
