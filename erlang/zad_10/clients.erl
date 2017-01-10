-module(clients).
-export([
  client/3,
  start/2
]).

client(Delay, [], Reverse)->
  receive
    {ids, ListOfIds} ->
        io:format("Client recieved ids: ~d~n", [length(ListOfIds)]),
        client(Delay, ListOfIds, Reverse)
  end;

client(Delay, ListOfIds, Reverse)->
  receive
    X ->
      io:format("Client recived: ~d~n", [X]),

      NextIndex = (X+1) rem length(ListOfIds),
      NextId = lists:nth(NextIndex, ListOfIds),
      sendAfter(Delay, NextId, X+1),

      case (Reverse) of
        true -> client(Delay, lists:reverse(ListOfIds), Reverse);
        false -> client(Delay, ListOfIds, Reverse)
      end
  end.

sendAfter(_Delay, Id, Payload)->
  Id ! Payload.

start(Delays, Reverse) ->
  ClientIds = lists:map(
      fun (D) ->
        io:format(D), spawn(?MODULE, client, [D, [], Reverse])
      end,
      Delays),
  lists:foreach(fun (Id) -> Id ! ClientIds end, ClientIds).
