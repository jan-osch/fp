-module(zad3).
-export([
  initialClient/0,
  client/1,
  startInitialClients/1,
  sendIds/2,
  start/1
]).

% Client that will only wait for nextId
initialClient()->
  io:format("Client: ~p staring - waiting for nextId ~n", [self()]),

  receive
    {nextId, Next} ->
        client(Next)
  end.

% Worker client
client(NextId)->
  receive
    [Head|Tail] ->
      io:format("Client: ~p recived: ~p~n", [self(), [Head|Tail]]),
      NextId ! [Head+1] ++ [Head|Tail],
      client(NextId)
  end.

% Main start function
start(N)->
  ClientIds = startInitialClients(N),
  io:format("Ids: ~p~n", [ClientIds]),
  sendIds(ClientIds, []),
  [Head|_] = ClientIds,
  Head ! [1].

% Initializes clients that wait for next id, returns PID list
startInitialClients(0) -> [];
startInitialClients(N) ->
  CurrentId = spawn(?MODULE, initialClient, []),
  [CurrentId] ++ startInitialClients(N-1).

% Sends next id to each client
sendIds([H|T], []) ->
  sendIds([H|T], T++[H]);
sendIds([Id|IdTail], [Next|NextTail])->
  Id ! {nextId, Next},
  sendIds(IdTail, NextTail);
sendIds([], [])->
  ok.
