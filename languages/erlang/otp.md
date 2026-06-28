# Erlang — OTP Behaviours

## gen_server

The generic server behaviour encapsulates the common client-server pattern.

```erlang
-module(counter_server).
-behaviour(gen_server).

%% API
-export([start_link/0, increment/0, get_count/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2]).

-record(state, {count = 0 :: non_neg_integer()}).

%% --- API ---

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

increment() ->
    gen_server:cast(?MODULE, increment).

get_count() ->
    gen_server:call(?MODULE, get_count).

%% --- Callbacks ---

init([]) ->
    {ok, #state{}}.

%% Synchronous request (blocks caller until reply)
handle_call(get_count, _From, #state{count = C} = State) ->
    {reply, C, State};
handle_call(_Request, _From, State) ->
    {reply, {error, unknown_request}, State}.

%% Asynchronous request (fire-and-forget)
handle_cast(increment, #state{count = C} = State) ->
    {noreply, State#state{count = C + 1}};
handle_cast(_Msg, State) ->
    {noreply, State}.

%% Handle non-OTP messages (e.g. from erlang:send_after)
handle_info(timeout, State) ->
    {noreply, State};
handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.
```

### Return value summary

| Callback | Return | Meaning |
|---|---|---|
| `init/1` | `{ok, State}` | Normal start |
| | `{stop, Reason}` | Fail to start |
| `handle_call/3` | `{reply, Reply, NewState}` | Reply to caller |
| | `{reply, Reply, NewState, Timeout}` | Reply, then timeout |
| `handle_cast/2` | `{noreply, NewState}` | Continue |
| `handle_info/2` | `{noreply, NewState}` | Continue |

## Supervisor

Supervisors manage child processes and restart them on failure.

```erlang
-module(my_supervisor).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
    SupFlags = #{
        strategy  => one_for_one,
        intensity => 5,    % max restarts
        period    => 10    % in this many seconds
    },
    ChildSpec = #{
        id       => counter_server,
        start    => {counter_server, start_link, []},
        restart  => permanent,
        shutdown => 5000,
        type     => worker,
        modules  => [counter_server]
    },
    {ok, {SupFlags, [ChildSpec]}}.
```

### Supervisor strategies

| Strategy | Behaviour |
|---|---|
| `one_for_one` | Only the failed child is restarted |
| `one_for_all` | All children are restarted if any fails |
| `rest_for_one` | The failed child and all started after it are restarted |

### Child restart types

| Type | Meaning |
|---|---|
| `permanent` | Always restart |
| `transient` | Restart only if terminated abnormally |
| `temporary` | Never restart |

## Application Behaviour

An OTP application is a component that can be started/stopped as a unit.

```erlang
-module(my_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    my_supervisor:start_link().

stop(_State) ->
    ok.
```

Application resource file (`my_app.app.src`):

```erlang
{application, my_app, [
    {description, "My application"},
    {vsn, "1.0.0"},
    {modules, []},
    {registered, [my_supervisor, counter_server]},
    {applications, [kernel, stdlib]},
    {mod, {my_app, []}}
]}.
```

```erlang
% Starting the application
application:start(my_app).
application:stop(my_app).
```

## Common Patterns

### Worker Pool

```erlang
% Using poolboy or a custom gen_server pool
poolboy:checkout(?POOL, fun(Worker) ->
    gen_server:call(Worker, do_work)
end).

% Simple pool with supervisor
start_pool(Size) ->
    [supervisor:start_child(pool_sup, [Id]) || Id <- lists:seq(1, Size)].
```

### Rate Limiter

```erlang
-module(rate_limiter).
-behaviour(gen_server).

-record(state, {
    tokens    :: non_neg_integer(),
    max       :: non_neg_integer(),
    interval  :: pos_integer()
}).

handle_call(try_consume, _From, #state{tokens = T} = S) when T > 0 ->
    {reply, ok, S#state{tokens = T - 1}};
handle_call(try_consume, _From, S) ->
    {reply, {error, rate_limited}, S}.

handle_info(refill, #state{max = M} = S) ->
    erlang:send_after(S#state.interval, self(), refill),
    {noreply, S#state{tokens = M}}.
```

## See Also

- [core.md](core.md) — pattern matching, functions, data types
- [concurrency.md](concurrency.md) — spawn, send/receive, links, monitors
