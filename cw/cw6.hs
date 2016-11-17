--ALIASY
type MyString = [Char]
-- alias typu
-- można zapisać wszędzie tam gdzie można zapisane jest [Char]


--NOWE TYPY
newtype X = [Int] -- nowy typ który
-- jego nie można zastąpić [Int]
f:: X -> X


--PRAWDZIWE TYPY
data Naturalne = Zero | Nast Naturalne
--po kolei występują konstruktuory elementów
-- pierwszy element: Zero - bez argumentowy konstruktor
-- drugi element: Nast Naturalne - jedno argumentowy konstruktor(przyjmuje typ Naturalne)
Zero:: Naturalne
Nast Zero :: Naturalne

x = Nast(Nast(Zero)) -- to jest 2
