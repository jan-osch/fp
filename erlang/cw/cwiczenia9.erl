%% spawn (<modul>, <funkcja>, <argumenty>)
%% funkcja musi być w eksporcie
%% moduł musi być
-module(cwiczenia9).
-import(drugi, [start0/0, say0/2]).

drugi:start0().


is_pid()
is_integer()
is_atom()
is_list()

%warunki logiczne:
,  % to samo co && and
;  % to samo co || or

%  możemy zrobić tak:

is_pid(X), {X, ping} -> X ! pong,

is_integer(M), M > 0, M -> io:format("~d~n", M).



% zadanie 4 klientów
% można wystartować 1 klienta i przekazać mu pid następnego
