-module(zad1).
-export([
  client/2,
  start_server/0,
  start_clients/2
]).

client(ListOfNumbers, Node)->
  {serverID, Node} ! {ListOfNumbers, self()},
  receive
    X when is_integer(X) ->
      io:format("Client with Id:~p recieved ~p~n", [self(), X])
  end.

server()->
  receive
    {L, ID} when is_list(L), is_pid(ID)->
      io:format("Received: ~p from ~p ~n", [L, ID]),
      ID ! sum_list(L),
      server()
  end.

sum_list([H|T])->
  H+ sum_list(T);
sum_list([])->
  0.

start_server()->
  register(serverid, spawn(?MODULE, server, [])).

start_clients([H|T], Node)->
  spawn(?MODULE, client, [H, Node]),
  start_clients(T, Node);

start_clients([], _)->
  ok.
