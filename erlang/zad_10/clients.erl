-module(clients).
-export([
  startA/1,
  startB/1,
  client/2
]).

client(Delay, [])->
  io:format("Client: ~p staring with delay: ~p~n", [self(), Delay]),

  receive
    {ids, [Next, Previous]} ->
        io:format("Client: ~p recieved ids~n", [self()]),
        client(Delay, [Next, Previous])
  end;

client(Delay, [Next, Previous])->
  receive
    X ->
      io:format("Client: ~p recived: ~p~n", [self(), X]),
      sendAfter(Delay, Next, X+1),
      client(Delay, [Previous, Next])
  end.

% Sends Payload to Id after Delay
sendAfter(Delay, Id, Payload)->
  timer:sleep(Delay * 1000),
  Id ! Payload.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task A
startA(Delays)->
  ClientIds = start(Delays),
  sendIds(ClientIds, []),
  sendStartToFirst(ClientIds).

% Send Ids for continous loop to Clients
sendIds([H|T], []) ->
  sendIds([H|T], T++[H]);

sendIds([Id|IdTail], [Next|NextTail])->
  Id ! {ids, [Next,Next]},
  sendIds(IdTail, NextTail);

sendIds([], [])->
  ok.

% Sends initial signal to start the loop
sendStartToFirst([First| _])->
  First ! 0.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Task B
startB(Delays)->
  ClientIds = start(Delays),
  sendIdsReverse(ClientIds, [], []),
  sendStartToFirst(ClientIds).

% Sends Ids for reversing to Clients
sendIdsReverse([H|T], [], []) ->
  [Next|TailNext] = T++[H],
  Last = sendIdsReverse(T, TailNext, [H]),
  H ! {ids, [Next, Last]};

sendIdsReverse([Id|IdTail], [Next|NextTail], [Previous]) ->
  Id ! {ids, [Next, Previous]},
  sendIdsReverse(IdTail, NextTail, [Id]);

sendIdsReverse([],[], [Previous])->
  Previous.

% Initializes clients that will wait for ids
start(Delays) ->
  lists:map(
      fun (D) ->
        spawn(?MODULE, client, [D, []])
      end,
      Delays).
