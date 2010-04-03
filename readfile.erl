-module(readfile).
-compile(export_all).

start(FilePath) ->
    {ok, S} = file:open(FilePath, read),
    register(printer, spawn(readfile, printText, [])),
    register(sender, spawn(readfile, getText, [S] )).


getText(File) ->
   TXT = io:get_line(File,''),
   sleep(300),
   printer ! {TXT},
   receive
       {printed} ->
          getText(File);
       {ok} ->
          file:close(File)
   end.

printText() ->
   receive
       {eof} ->
           io:format("[eof]~n"),
           sender ! {ok};
       {Text} ->
           io:format("        ~p~n",[Text]),
           sleep(300),
           sender ! {printed},
           printText()
   end.

sleep(T) ->
   receive
   after T -> true
   end.

