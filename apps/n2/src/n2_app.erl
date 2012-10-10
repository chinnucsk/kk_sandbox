-module(n2_app).
-behaviour(application).
-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    n2_sup:start_link().

stop(_State) ->
    ok.
