# C# — Async Programming

The Task-based Asynchronous Pattern (TAP) is the primary model for async programming in C#. Built on `Task` and `Task<T>`, with language support via `async`/`await`.

## Task, Task\<T\>, ValueTask

| Type | Purpose | Allocation |
|---|---|---|
| `Task` | Represents an async operation with no result | Reference type (heap) |
| `Task<T>` | Async operation returning `T` | Reference type (heap) |
| `ValueTask` | No-result async, may complete synchronously | Value type (stack-optimized) |
| `ValueTask<T>` | Async returning `T`, may complete synchronously | Value type (stack-optimized) |

```csharp
// Task — fire-and-forget or await
Task send = SendEmailAsync("user@example.com");
await send;

// Task<T> — await for a result
Task<string> fetch = httpClient.GetStringAsync(url);
string html = await fetch;

// ValueTask — avoid heap allocation for sync-completing paths
ValueTask<int> result = cache.GetOrFetchAsync(key);
int value = await result;

// ValueTask rules: await only once; call .AsTask() if you need multiple awaits
Task<int> asTask = result.AsTask();
```

## async / await Pattern

```csharp
public async Task<Order> GetOrderAsync(int id)
{
    // Synchronous portion runs on caller's thread
    ValidateId(id);

    // Await yields control; continuation may resume on captured context
    var order = await dbContext.Orders.FindAsync(id);

    // Code after await resumes on captured SynchronizationContext (or TaskScheduler)
    return order;
}

// Async void — ONLY for event handlers
button.Click += async (s, e) =>
{
    await RefreshDataAsync(); // exception propagates to SynchronizationContext
};

// async Task — use everywhere else
public async Task ProcessAsync()
{
    await Step1Async();
    await Step2Async(); // runs sequentially after Step1
}
```

## ConfigureAwait(false)

Prevents capturing the original `SynchronizationContext` (e.g., UI thread) on the continuation. Critical in library code to avoid deadlocks.

```csharp
// Library code — always use ConfigureAwait(false)
public async Task<string> FetchDataAsync()
{
    var response = await httpClient.GetAsync(url)
        .ConfigureAwait(false);
    return await response.Content.ReadAsStringAsync()
        .ConfigureAwait(false);
}

// UI code — DO NOT use ConfigureAwait(false); must return to UI thread
private async void Button_Click(object sender, EventArgs e)
{
    var data = await FetchDataAsync(); // captures UI context
    label.Text = data; // safe — on UI thread
}
```

## Concurrency: WhenAll, WhenAny

```csharp
// WhenAll — run in parallel, wait for all
var tasks = new[]
{
    FetchUserAsync(1),
    FetchUserAsync(2),
    FetchUserAsync(3),
};
User[] users = await Task.WhenAll(tasks); // all complete or first exception

// WhenAny — respond to first completion
var timeout = Task.Delay(TimeSpan.FromSeconds(5));
var completed = await Task.WhenAny(fetchTask, timeout);
if (completed == timeout)
    throw new TimeoutException("Request timed out");

// Parallel processing with result handling
var results = await Task.WhenAll(urls.Select(async url =>
{
    var content = await httpClient.GetStringAsync(url);
    return (url, content);
}));
```

## CancellationToken

```csharp
// CancellationTokenSource creates and cancels tokens
using var cts = new CancellationTokenSource(TimeSpan.FromSeconds(10));

// Pass token to async methods
var data = await httpClient.GetStringAsync(url, cts.Token);

// Poll for cancellation
token.ThrowIfCancellationRequested();

// Register a callback
token.Register(() => Console.WriteLine("Cancelled"));

// Link multiple tokens
using var linked = CancellationTokenSource.CreateLinkedTokenSource(token1, token2);

// CancellationToken.None — no-op token for required parameters
public Task DoWorkAsync(CancellationToken ct = default) { }

// Cancellation in a loop
for (int i = 0; i < items.Count; i++)
{
    ct.ThrowIfCancellationRequested();
    await ProcessItemAsync(items[i], ct);
}
```

## IAsyncEnumerable (C# 8+)

Stream results as they become available. Use `await foreach` to consume.

```csharp
// Producer — yields results as they arrive
public async IAsyncEnumerable<Order> GetOrdersAsync(
    [EnumeratorCancellation] CancellationToken ct = default)
{
    int offset = 0;
    while (true)
    {
        var batch = await db.Orders
            .OrderBy(o => o.Id)
            .Skip(offset)
            .Take(100)
            .ToListAsync(ct);
        if (batch.Count == 0) yield break;
        foreach (var order in batch)
            yield return order;
        offset += 100;
    }
}

// Consumer
await foreach (var order in GetOrdersAsync(ct))
{
    await ProcessOrderAsync(order, ct);
}

// LINQ on IAsyncEnumerable (via System.Linq.Async)
var filtered = GetOrdersAsync()
    .Where(o => o.Price > 100)
    .Select(o => o.Id);
```

## Channels (System.Threading.Channels)

Producer-consumer pattern with bounded or unbounded capacity, natively async.

```csharp
var channel = Channel.CreateBounded<WorkItem>(new BoundedChannelOptions(100)
{
    FullMode = BoundedChannelFullMode.Wait
});

// Producer
async Task ProduceAsync(ChannelWriter<WorkItem> writer)
{
    foreach (var item in GenerateItems())
    {
        await writer.WriteAsync(item);
    }
    writer.Complete(); // signal no more items
}

// Consumer
async Task ConsumeAsync(ChannelReader<WorkItem> reader)
{
    await foreach (var item in reader.ReadAllAsync())
    {
        await ProcessAsync(item);
    }
}

// Multiple consumers (fan-out)
Parallel.For(0, 4, async _ => await ConsumeAsync(channel.Reader));
```

## See Also

- [core.md](core.md) — exceptions, pattern matching, records
- [linq.md](linq.md) — IAsyncEnumerable LINQ, EF Core async queries