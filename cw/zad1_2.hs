makeNext g x = (x + g/x) / 2

przyblizenia g xZero = iterate (makeNext g) xZero

sprawdzDelte d (x, y) = abs(x-y) >= d

pierwiastek g x0 d = snd (last (listaParSpelniajacych))
  where przyb = przyblizenia g x0
        listaPar = zip przyb (tail przyb)
        listaParSpelniajacych = takeWhile (sprawdzDelte d) listaPar
