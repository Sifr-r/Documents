# Erlang — Concurrency

Erlang's concurrency model is based on lightweight isolated processes that communicate via asynchronous message passing.

## Spawning Processes

```erlang
% spawn — fire and forget, no link
Pid = spawn(fun() -> io:format("hello~n") end).

% spawn with module, function, args
Pid = spawn(module, function, [Arg1, Arg2]).

% spawn_link — linked to caller (if child dies, caller dies too)
Pid = spawn_link(fun() ->
    receive
        stop -> ok
    end
end).

% spawn_monitor — returns {Pid, MonitorRef}, sends 'DOWN' on exit
{Pid, Ref} = spawn_monitor(fun() ->
    exit(crash)
end).

% spawn_opt — advanced options
Pid = spawn_opt(fun() -> work() end, [link, {priority, high}]).
```

## Send and Receive

```erlang
% Send message to a process
Pid ! {self(), hello}.

% Receive with pattern matching and timeout
receive
    {From, hello} ->
        From ! {self(), hi_back};
    stop ->
        ok
after 5000 ->
    timeout
end.

% Selective receive — messages that don't match stay in mailbox
receive
    {important, Data} -> handle(Data)
after 1000 ->
    ok
end.
```

## Process Links

Links are bidirectional. If one linked process dies abnormally, the other receives an exit signal.

```erlang
% Create a link
link(Pid).

% Remove a link
unlink(Pid).

% Trap exits — convert exit signals to messages
process_flag(trap_exit, true).

% Now exits arrive as messages:
receive
    {'EXIT', Pid, Reason} ->
        io:format("~p died: ~p~n", [Pid, Reason])
end.

% Common pattern: start_link for supervised processes
start_link() ->
    spawn_link(fun loop/0).
```

## Process Monitors

Monitors are unidirectional. A `DOWN` message is sent when the monitored process dies.

```erlang
% Create a monitor
Ref = monitor(process, Pid).

% Receive notification
receive
    {'DOWN', Ref, process, Pid, Reason} ->
        io:format("~p went down: ~p~n", [Pid, Reason])
end.

% Remove a monitor
demonitor(Ref).

% Monitor + demonitor safely
demonitor(Ref, [flush, info]).  % removes monitor and flushes queued DOWN
```

## Message Passing Patterns

### Request-Reply

```erlang
% Client
call(ServerPid, Request) ->
    ServerPid ! {self(), Request},
    receive
        {ServerPid, Reply} -> Reply
    after 5000 ->
        {error, timeout}
    end.

% Server
loop(State) ->
    receive
        {From, get_count} ->
            From ! {self(), State#state.count},
            loop(State);
        {From, {set_count, N}} ->
            From ! {self(), ok},
            loop(State#state{count = N})
    end.
```

### Fan-out / Fan-in

```erlang
% Send work to N workers, collect all results
fan_out(WorkItems) ->
    Parent = self(),
    Pids = [spawn(fun() ->
        Result = process(Item),
        Parent ! {self(), Result}
    end) || Item <- WorkItems],
    [receive {Pid, Result} -> Result end || Pid <- Pids].
```

### Registered processes

```erlang
% Register a process by atom name
register(my_server, Pid).

% Send to registered name
my_server ! {self(), ping}.

% Unregister
unregister(my_server).
```

## gen_statem

State machine behaviour for complex protocol implementations.

```erlang
-module(door).
-behaviour(gen_statem).

-export([start_link/0, push/0, init/1, callback_mode/0,
         locked/3, unlocked/3]).

start_link() -> gen_statem:start_link({local, ?MODULE}, ?MODULE, [], []).
push()       -> gen_statem:cast(?MODULE, push).

init([]) -> {ok, locked, #{code => "1234"}}.
callback_mode() -> state_functions.

locked(cast, push, Data) ->
    io:format("Door is locked~n"),
    {keep_state, Data};
locked(cast, {code, Code}, #{code := Code} = Data) ->
    {next_state, unlocked, Data}.

unlocked(cast, push, Data) ->
    io:format("Door opened~n"),
    {next_state, locked, Data}.
```

### gen_statem callback modes

| Mode | Description |
|---|---|
| `state_functions` | One function per state (`locked/3`, `unlocked/3`) |
| `handle_event_function` | Single `handle_event/4` for all states |

## See Also

- [core.md](core.md) — pattern matching, functions, data types
- [otp.md](otp.md) — gen_server, supervisor, application behaviours
