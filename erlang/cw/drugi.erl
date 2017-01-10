
-module(drugi).
-export([say0/2, start0/0]).

%% warunek stopu
say0(S, 0) ->
  0; %% tu musi być średnik bo będzie dalsza definicja tej funkcji

%% funkcja ktora przyjmuje dwa argumenty - stringa i ile razy wyswielic
say0(S, N) ->
  io: format("~w~n", [S]), %% ~n to znak nowej linii
  say0(S, N-1).

start0 () ->
  %% spawn (<modul>, <funkcja>, <argumenty>)
  %% funkcja musi być w eksporcie
  %% moduł musi być
  spawn (drugi, say0, ["dzien",3]),
  spawn (drugi, say0, ["dobry",3]).
