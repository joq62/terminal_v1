%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description : dbase using dets 
%%% 
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(print_test).  
   
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
-include_lib("eunit/include/eunit.hrl").
%% --------------------------------------------------------------------

%% External exports
-export([start/0]).



%% ====================================================================
%% External functions
%% ====================================================================

%% --------------------------------------------------------------------
%% Function:tes cases
%% Description: List of test cases 
%% Returns: non
%% --------------------------------------------------------------------
start()->
    ?debugMsg("Start setup"),
    ?assertEqual(ok,setup()),
    ?debugMsg("stop setup"),
    

    ?debugMsg("Start print_text"),
    ?assertEqual(ok,print_text("Test 1 ~n")),
    ?assertEqual(ok,print_text("Hej ")),
    ?assertEqual(ok,print_text("Erika ~n")),
    ?assertEqual(ok,print_text("Greetings from ")),
    ?assertEqual(ok,print_text("Sidney ~n ")),
    ?debugMsg("stop print_text"),


    ?debugMsg("Start print_text_list"),
    ?assertEqual(ok,print_text("Test 2 ~p~n",[{?MODULE,?LINE}])),
    ?assertEqual(ok,print_text("Hej ~p",[date()])),
    ?assertEqual(ok,print_text("Erika ~n")),
    ?assertEqual(ok,print_text("Greetings from ")),
    ?assertEqual(ok,print_text("Sidney ~n ")),
    ?debugMsg("stop print_text_list"),
      %% End application tests
    ?debugMsg("Start cleanup"),
    ?assertEqual(ok,cleanup()),
    ?debugMsg("Stop cleanup"),

    ?debugMsg("------>"++atom_to_list(?MODULE)++" ENDED SUCCESSFUL ---------"),
    ok.


%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------

print_text(Text,List)->
    {ok,HostId}=net:gethostname(),
    Terminal=list_to_atom("terminal@"++HostId),
    rpc:call(Terminal,terminal,print,[Text,List]),
    ok.


print_text(Text)->
    {ok,HostId}=net:gethostname(),
    Terminal=list_to_atom("terminal@"++HostId),
    rpc:call(Terminal,terminal,print,[Text]),
    ok.
    
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
setup()->

    ok.

%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% -------------------------------------------------------------------    

cleanup()->
   init:stop(),
    ok.
%% --------------------------------------------------------------------
%% Function:start/0 
%% Description: Initiate the eunit tests, set upp needed processes etc
%% Returns: non
%% --------------------------------------------------------------------
