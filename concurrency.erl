-module(concurrency).
-export([start/1]).

start(N) ->
   register(pa, spawn(fun() ->  a(N) end)),
   register(pb, spawn(fun() ->  b(N) end)),
   register(pc, spawn(fun() ->  c(N) end)),
   io:format("Todas as chamdas~n").

a(0) -> ok;
a(N) ->
   io:format("A~n"),
   sleep(300),
   a(N-1).

b(0) -> ok;
b(N) ->
   io:format("B~n"),
   sleep(200),
   b(N-1).

c(0) ->ok;
c(N) ->
   io:format("C~n"),
   sleep(300),
   c(N-1).

sleep(T) ->
   receive
   after T -> true
   end.

