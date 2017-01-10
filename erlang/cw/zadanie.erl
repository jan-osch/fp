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
