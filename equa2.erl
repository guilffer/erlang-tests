-module(equa2).
-export([bask/3, solve/3, delta/3]).

-import(math).

solve(A,B,C) -> 
   io:format("~Bx^2 ~Bx ~B",[A,B,C]),
   Delta = delta(A,B,C),
   io:format(" => ~p~n",[bask(A,B,Delta)]).

bask(_,_,Delta) when Delta  < 0 ->
    false;

bask(A,B,Delta) when Delta == 0 ->
   {(-B)/(2*A)};

bask(A,B,Delta) ->
   {(-B + math:sqrt(Delta))/(2*A),(-B - math:sqrt(Delta))/(2*A)}.

delta(A,B,C) -> (B*B)-(4*A*C).
