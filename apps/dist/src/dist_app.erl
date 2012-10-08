-module(dist_app).
-behaviour(application).
-export([start/2, stop/1]).

start(StartType, StartArgs) ->
    error_logger:info_msg("Start dist app ~p~n", [StartType] ++ StartArgs),
    dist_sup:start_link().

stop(_State) ->
    error_logger:info_msg("Stop dist app"),
    ok.
