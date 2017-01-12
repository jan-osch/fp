-module(clients).
-export([
  startA/1,
  startB/1,
  client/3
]).

client(Delay, [], Reverse)->
  io:format("Client: ~p staring with delay: ~p reverse: ~p~n", [self(), Delay, Reverse]),

  receive
    {ids, ListOfIds} ->
        io:format("Client: ~p recieved ids: ~p~n", [self(), ListOfIds]),
        client(Delay, ListOfIds, Reverse)
  end;

client(Delay, ListOfIds, Reverse)->
  receive
    X ->
      io:format("Client: ~p recived: ~p~n", [self(), X]),
      NextId = getNextId(ListOfIds, X+1),
      sendAfter(Delay, NextId, X+1),

      case (Reverse) of
        true -> client(Delay, lists:reverse(ListOfIds), Reverse);
        false -> client(Delay, ListOfIds, Reverse)
      end
  end.

% Extracts element at Index (or it's remainder) from list.
getNextId(List, Index) when Index >= length(List) ->
  getNextId(List, Index rem length(List));

getNextId([_|T], Index) when Index > 0 ->
  getNextId(T, Index -1);

getNextId([H|_], 0)->
  H.

% Sends Payload to Id after Delay
sendAfter(Delay, Id, Payload)->
  timer:sleep(Delay * 1000),
  Id ! Payload.

% Send list of ids to all processes in the list
sendIds([H|T], ClientIds) ->
  H ! {ids, ClientIds},
  sendIds(T, ClientIds);

sendIds([], _)->
  ok.


start(Reverse, Delays) ->
  ClientIds = lists:map(
      fun (D) ->
        spawn(?MODULE, client, [D, [], Reverse])
      end,
      Delays),

  sendIds(ClientIds, ClientIds),
  [FirstId| _] = ClientIds,
  FirstId ! 0.

startA(Delays)->
  start(false, Delays).

startB(Delays)->
  start(true, Delays).
