# Elixir — Processes & Concurrency

Every Elixir computation runs inside a lightweight process (not an OS process).
Processes are isolated, communicate via message passing, and share no memory.

## spawn and spawn_link

```elixir
# spawn — creates an independent process
pid = spawn(fn ->
  IO.puts("hello from #{inspect(self())}")
end)

# spawn_link — linked to the caller; if either crashes, both crash
pid = spawn_link(fn ->
  do_work()
end)

# spawn with MFA (module, function, args)
spawn(MyModule, :function_name, [arg1, arg2])
spawn_link(MyModule, :function_name, [arg1, arg2])
```

## send and receive

```elixir
# Send a message to a process
send(pid, {:hello, self()})

# Receive messages (pattern matched, FIFO within matching)
receive do
  {:hello, from} ->
    send(from, :world)

  {:stop, reason} ->
    IO.puts("stopping: #{reason}")

after
  5_000 -> IO.puts("timeout — no message received in 5s")
end
```

## Message Passing Patterns

```elixir
# Request-response pattern
defmodule PingPong do
  def loop do
    receive do
      {:ping, from} ->
        send(from, :pong)
        loop()

      :stop -> :ok
    end
  end

  def start do
    pid = spawn_link(__MODULE__, :loop, [])
    Process.register(pid, :pingpong)
    pid
  end
end

# Send by registered name
send(:pingpong, {:ping, self()})
receive do
  :pong -> IO.puts("got pong")
end
```

## Process Monitoring

A monitor sends a `:DOWN` message when the monitored process exits.
Monitors are unidirectional and do not crash the monitoring process.

```elixir
pid = spawn(fn -> Process.sleep(1_000) end)
ref = Process.monitor(pid)

receive do
  {:DOWN, ^ref, :process, ^pid, reason} ->
    IO.puts("process exited: #{inspect(reason)}")
end

# Demonitor if no longer needed
Process.demonitor(ref)
```

## Process Linking

Links are bidirectional. If either process crashes, the linked process
receives an exit signal.

```elixir
pid = spawn(fn -> Process.sleep(:infinity) end)
Process.link(pid)

# Trap exits to receive :EXIT instead of crashing
Process.flag(:trap_exit, true)

receive do
  {:EXIT, ^pid, reason} ->
    IO.puts("linked process exited: #{inspect(reason)}")
end

# Unlink
Process.unlink(pid)
```

## Process Dictionary

A per-process key-value store. Avoid in production code — it hides state
and makes testing difficult. Use Agent or GenServer instead.

```elixir
Process.put(:my_key, "value")
Process.get(:my_key)  # "value"
Process.delete(:my_key)
Process.get_keys()    # list all keys
```

## ETS (Erlang Term Storage)

In-memory key-value tables shared across processes. Fast, no copying on read.

```elixir
# Create a table
table = :ets.new(:cache, [:set, :named_table, read_concurrency: true])

# Options: :set | :ordered_set | :bag | :duplicate_bag
# Access: :public | :protected | :private

# Insert
:ets.insert(:cache, {:user_1, "Ada", 30})
:ets.insert(:cache, {:user_2, "Bob", 25})

# Lookup
:ets.lookup(:cache, :user_1)  # [{:user_1, "Ada", 30}]

# Match patterns
:ets.match(:cache, {:"$1", :"$2", :_})  # [[:user_1, "Ada"], [:user_2, "Bob"]]

# Select with guard
:ets.select(:cache, [
  {{:"$1", :"$2", :"$3"}, [{:>, :"$3", 28}], [:"$$"]}
])

# Traverse
:ets.foldl(fn {key, name, age}, acc ->
  [{key, name} | acc]
end, [], :cache)

# Delete
:ets.delete(:cache, :user_1)
:ets.delete(:cache)  # delete entire table

# Info
:ets.info(:cache, :size)   # number of entries
:ets.info(:cache, :memory) # words of memory
```

### ETS table types

| Type | Behavior |
|---|---|
| `:set` | Unique keys, unordered |
| `:ordered_set` | Unique keys, ordered by term |
| `:bag` | Multiple objects per key, no duplicates |
| `:duplicate_bag` | Multiple objects per key, duplicates allowed |

## See Also

- [core.md](core.md) — language fundamentals and syntax
- [otp.md](otp.md) — GenServer, Supervisor, and higher-level abstractions
