module Codewars.Kata.Evaporator where

evaporator :: Double -> Double -> Double -> Integer
evaporator content evap_per_day threshold =
  evaporatorHelper content percentStays border

  where percentStays = (100 - evap_per_day) / 100
        border = content * threshold / 100

evaporatorHelper :: Double -> Double -> Double -> Integer
evaporatorHelper content percentStays border =
  if content < border
    then 0
    else 1 + evaporatorHelper contentNextDay percentStays border
    where contentNextDay = percentStays * content
