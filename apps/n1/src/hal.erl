-module(hal).
-include_lib("inets/include/httpd.hrl").
-export([body/3,snmp/3]).

snmp(SessionId, _Env, _Input) ->
    {H, M, S} = time(),
    mod_esi:deliver(SessionId, ["Content-Type:text/html\r\n\r\n" | io_lib:format("~p:~p:~p", [H, M, S])]).

body(SessionId, Env, _Input) ->
    mod_esi:deliver(SessionId, ["Content-Type:text/html\r\n\r\n" | body(Env)]).

body([]) ->
    "<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"http://localhost:8881/n1.css\" />"++
    "<script type=\"text/javascript\" src=\"http://localhost:8881/jquery.js\"></script>"++
    "<script>function comet(){$.ajax({" ++
	"type: 'Get', url: 'http://localhost:8881/manager/hal:snmp', async: true, cache: false,"++
	"success : function(data){ $('#demo').html(data); setTimeout('comet()', 1000)}," ++
	"error: function(XMLHttpRequest, textstatus, error){ $('#demo').html(texststatus), setTimeout('comet()', 5000);}});}" ++
    "$(function(){comet();});</script></head><body>" ++
    "<div id=\"demo\" class=\"demo\">Hello</p>" ++
    "</body></html>";
body([{_Key, _Value} | Env]) ->
    body(Env).