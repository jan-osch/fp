-module(zad15_3).
-export([
  start/0,
  process/0
]).

process()->
  receive
    {PID, X, D} ->
        case abs(X) > 100 of
          true -> E = -D;
          false -> E = D
        end,
        io:format("~p~n", [X]),
        PID ! {self(), X+E, E},
        process()
  end.

start()->
  PID_1 = spawn(?MODULE, process, []),
  PID_2 = spawn(?MODULE, process, []),

  PID_1 ! {PID_2, 1, 2}.
