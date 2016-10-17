module DigitalRoot where

digitalRoot :: Integer -> Integer
digitalRoot number =
  if number < 10 then number
  else digitalRoot newNumber

  where newNumber = sum (getDigits number)


getDigits :: Integer -> [Integer]
getDigits number =
  if number < 10 then [number]
  else modulo : (getDigits rest)

  where modulo = number `mod` 10
        rest = floor (fromIntegral number / 10)
