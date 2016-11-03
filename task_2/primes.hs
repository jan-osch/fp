isPrimeHelper n previous = all (\ d -> n `mod` d /= 0) previous

primes = 2: [x | x <- [3,4..], isPrimeHelper x (takeWhile (\ d -> d * d <= x) primes) ]
