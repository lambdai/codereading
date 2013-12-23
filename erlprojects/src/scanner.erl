-module(scanner).
-export([list_erl_files/1, list_erl_modules/1]).
-compile([export_all]).

list_erl_modules(Files) ->
    [filename:rootname(filename:basename(FileName)) || FileName <- Files].

list_erl_files(Dir) ->
    lists:filtermap(fun(FileName) ->
			    case lists:suffix(".erl", FileName) of
				true ->
				    {true, FileName};
				_ ->
				    false
			    end
		    end,
		    list_files(Dir)).

list_files(Dir) ->
    list_files([], [Dir]).
list_files(Files, []) ->
    Files;
list_files(Files, [Dir|Rest]) ->
    NewFiles = case file:list_dir_all(Dir) of
		   {ok, FileNames} ->
		       FileNames;
		   {error, _} ->
		       []
	       end,
    NewAdded = [ Dir ++"/" ++  FName || FName <- NewFiles,
			 filelib:is_file(Dir ++"/" ++ FName) == true],
    NewDir = [ Dir ++ "/" ++ FName || FName <- NewFiles,
		      filelib:is_dir(Dir ++ "/" ++ FName) == true],
    list_files(NewAdded ++ Files, NewDir ++ Rest).
    
    

    

scan_erl(FileName) ->
    {ok, Fd} = file:open(FileName, [read]),
    io:parse_erl_form(Fd, "").
