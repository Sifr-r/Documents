# Elixir — OTP Behaviours

## GenServer

A GenServer encapsulates state and provides synchronous (`call`) and asynchronous (`cast`) interfaces.

```elixir
defmodule Counter do
  use GenServer

  # --- Client API ---

  def start_link(initial \\ 0) do
    GenServer.start_link(__MODULE__, initial, name: __MODULE__)
  end

  def get, do: GenServer.call(__MODULE__, :get)
  def increment, do: GenServer.cast(__MODULE__, :increment)
  def add(n), do: GenServer.call(__MODULE__, {:add, n})

  # --- Server callbacks ---

  @impl true
  def init(initial_state) do
    {:ok, initial_state}
  end

  @impl true
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  def handle_call({:add, n}, _from, state) do
    {:reply, state + n, state + n}
  end

  @impl true
  def handle_cast(:increment, state) do
    {:noreply, state + 1}
  end

  @impl true
  def handle_info(:timeout, state) do
    # handles non-call/cast messages
    {:noreply, state}
  end
end

# Usage
{:ok, pid} = Counter.start_link(0)
Counter.increment()   # cast — async, no reply
Counter.get()         # call — sync, returns 1
Counter.add(10)       # call — sync, returns 11
```

### GenServer callback return values

| Callback | Return tuple |
|---|---|
| `init/1` | `{:ok, state}` or `{:stop, reason}` |
| `handle_call/3` | `{:reply, reply, state}` |
| `handle_cast/2` | `{:noreply, state}` |
| `handle_info/2` | `{:noreply, state}` |

## Supervisor

Supervisors manage child processes with restart strategies.

```elixir
defmodule MyApp.Supervisor do
  use Supervisor

  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    children = [
      {MyApp.Counter, 0},           # worker
      MyApp.Repo,                    # worker
      {MyApp.CacheSupervisor, []}   # child supervisor
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
```

### Strategies

| Strategy | Behavior |
|---|---|
| `:one_for_one` | Only the crashed child is restarted |
| `:one_for_all` | All children are restarted if one crashes |
| `:rest_for_one` | The crashed child and all started after it are restarted |

```elixir
# Options for child spec
Supervisor.child_spec(MyApp.Worker,
  id: :my_worker,
  restart: :transient,   # :permanent | :transient | :temporary
  shutdown: 5000,         # ms or :brutal_kill
  type: :worker           # :worker | :supervisor
)
```

## Application Behaviour

```elixir
defmodule MyApp do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyApp.Repo,
      {MyApp.Supervisor, []}
    ]

    opts = [strategy: :one_for_one, name: MyApp.AppSupervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def stop(_state) do
    :ok
  end
end

# In mix.exs
def application do
  [
    mod: {MyApp, []},
    extra_applications: [:logger, :runtime_tools]
  ]
end
```

## Task and Task.Supervisor

```elixir
# One-off async task
task = Task.async(fn -> expensive_computation() end)
result = Task.await(task, 10_000)  # 10s timeout

# Fire-and-forget
Task.start(fn -> send_email() end)

# Task.Supervisor — managed, supervised tasks
{:ok, pid} = Task.Supervisor.start_link(name: MyApp.TaskSup)

Task.Supervisor.async(MyApp.TaskSup, fn -> work() end)
|> Task.await()

# Supervised async via child spec
{Task, fn -> work() end}
```

## Agent

Simple state wrapper around GenServer for key-value or accumulator patterns.

```elixir
{:ok, pid} = Agent.start_link(fn -> %{} end, name: :cache)

Agent.update(:cache, &Map.put(&1, :key, "value"))
Agent.get(:cache, &Map.get(&1, :key))  # "value"

# Stop
Agent.stop(:cache)
```

## Registry

Local, decentralized process registry. Names processes with arbitrary terms.

```elixir
# Start registry (usually in supervision tree)
{Registry, keys: :unique, name: MyApp.Registry}

# Register a process
{:ok, pid} = Registry.register(MyApp.Registry, {:chat, "room-1"}, %{})

# Send message to registered process
Registry.send(MyApp.Registry, {:chat, "room-1"}, {:msg, "hello"})

# Lookup
Registry.lookup(MyApp.Registry, {:chat, "room-1"})
# [{pid, meta}]

# keys: :unique — one pid per key
# keys: :duplicate — multiple pids per key
```

## DynamicSupervisor

Starts children dynamically at runtime (vs. static child list).

```elixir
defmodule MyApp.WorkerSupervisor do
  use DynamicSupervisor

  def start_link(opts \\ []) do
    DynamicSupervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_worker(args) do
    spec = {MyApp.Worker, args}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end

  def stop_worker(pid) do
    DynamicSupervisor.terminate_child(__MODULE__, pid)
  end
end
```

## See Also

- [core.md](core.md) — language fundamentals and syntax
- [processes.md](processes.md) — low-level process primitives and ETS
