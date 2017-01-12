% Wariant zadania  - przesyłaj atom z identyfikatorem operacji
%Takie zadanko:
-module(cw10).
-export([
  client/1,
  server/1,
  start/1
]).


client(ListOfNumbers)->
  serverID ! ListOfNumbers,
  receive
    X, is_integer(X) ->
      io:format("Client with Id:~p recieved ~p~n", [self(), X])
  end.
%%%%WARIANT  - komunikacja między wieloma maszynami
% aby wysłać do innego Node
{PID, NODE} ! msg % gdzie NODE to

% można połaczyć się z atomem na innym node:
atom1@node1 %- w ten sposób

% możemy zrobić tak
{serverID, N} ! msg % szuka atomu serverID na nodzie N
