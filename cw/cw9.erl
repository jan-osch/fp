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


-module(zadanie).

-export([start/0, clientOne/1, serverOne/0]).

start() ->
  register(serverX, spawn(?MODULE, serverOne, [])),
  %% rejestrujemy pod globalna zmienna serverX
  %% teraz mozemy robic serverX ! komunikat

  spawn(?MODULE, clientOne, [50]).


clientOne(0)->
  io:format("Client: finished~n"),
  ok;

clientOne(N) ->
  serverX ! {self(), ping},
  io:format("Client: sending ping~n"),
  clientOne(N-1).

serverOne() ->
  receive
    {X, ping} -> X ! pong,
    io:format("Server: got ping~n"),
    serverOne()
  end.

%%
%% %%%% recive
%%
%% recive
%%   {X, ping} ->

%% wsyłanie

%% serverX



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
