# Kotlin — Coroutines

## Basics

Add `kotlinx-coroutines-core` dependency.

```kotlin
// launch — fire and forget, returns Job
val job = CoroutineScope(Dispatchers.Default).launch {
    // suspendable work
}

// async — returns a result via Deferred
val deferred = CoroutineScope(Dispatchers.IO).async {
    fetchFromNetwork()
}
val result = deferred.await()    // suspend until result ready

// runBlocking — bridge blocking and suspend worlds (tests, main)
fun main() = runBlocking {
    val result = async { compute() }.await()
    println(result)
}
```

## Dispatchers

| Dispatcher | Purpose |
|---|---|
| `Dispatchers.Main` | UI thread (Android, JavaFX) |
| `Dispatchers.IO` | Disk/network I/O (shared pool) |
| `Dispatchers.Default` | CPU-intensive work (core-count pool) |
| `Dispatchers.Unconfined` | No thread confinement (rarely used) |

```kotlin
launch(Dispatchers.Default) {
    val data = withContext(Dispatchers.IO) {
        loadFromDisk()          // switch to IO, then back
    }
    process(data)                // back on Default
}
```

## Structured Concurrency

Coroutines are scoped — canceling the scope cancels children.

```kotlin
// coroutineScope — suspend, fails if any child fails
suspend fun loadAll(): List<Data> = coroutineScope {
    val a = async { loadA() }
    val b = async { loadB() }
    a.await() + b.await()       // if either fails, both cancelled
}

// supervisorScope — children fail independently
suspend fun loadSafely(): List<Data> = supervisorScope {
    val a = async { loadA() }
    val b = async { loadB() }
    listOf(
        try { a.await() } catch (e: Exception) { emptyList() },
        try { b.await() } catch (e: Exception) { emptyList() },
    ).flatten()
}

// Custom scope (Android ViewModel pattern)
class MyViewModel : ViewModel() {
    private val scope = CoroutineScope(
        Dispatchers.Main + SupervisorJob() + CoroutineExceptionHandler { _, e ->
            log(e)
        }
    )

    fun fetch() {
        scope.launch {
            val data = withContext(Dispatchers.IO) { api.getData() }
            updateUi(data)
        }
    }

    override fun onCleared() {
        scope.cancel()          // cancel all running coroutines
    }
}
```

## Cancellation

```kotlin
val job = scope.launch {
    while (isActive) {          // check cancellation
        // work
    }
    // or: ensureActive()       // throws CancellationException
}
job.cancel()                    // cooperative — only cancels at suspend points

// withTimeout
val result = withTimeout(5000) {
    longRunningTask()
} // throws TimeoutCancellationException if over 5s

// Non-cancellable block
withContext(NonCancellable) {
    // cleanup that must complete even after cancellation
    db.close()
}
```

## Flow

Cold asynchronous stream — emits values sequentially.

```kotlin
// Build
val flow = flow {
    for (i in 1..3) {
        delay(100)          // simulate work
        emit(i)             // emit value
    }
}

// Collect
flow.collect { value ->
    println(value)
}

// Operators
flow
    .map { it * 2 }
    .filter { it > 2 }
    .take(2)                // take first 2 emissions
    .flowOn(Dispatchers.IO) // switch upstream context
    .catch { e -> emit(fallback) }  // handle errors
    .onEach { log(it) }     // side effect
    .collect { process(it) }

// StateFlow — hot, state holder (replaces LiveData)
class Counter {
    private val _count = MutableStateFlow(0)
    val count: StateFlow<Int> = _count.asStateFlow()

    fun increment() { _count.update { it + 1 } }
}

// SharedFlow — hot, multicast (events)
private val _events = MutableSharedFlow<UiEvent>()
val events: SharedFlow<UiEvent> = _events.asSharedFlow()

fun onButtonClick() {
    viewModelScope.launch {
        _events.emit(UiEvent.Clicked)
    }
}
```

## Channel

Hot stream — rendezvous between coroutines.

```kotlin
val channel = Channel<Int>(Channel.BUFFERED)  // capacity options

// Producer
scope.launch {
    for (i in 1..5) {
        channel.send(i)
    }
    channel.close()             // signal completion
}

// Consumer
scope.launch {
    for (value in channel) {    // iterate until closed
        process(value)
    }
}

// produce — convenience builder
val numbers = scope.produce {
    for (i in 1..5) send(i)
}
numbers.consumeEach { println(it) }
```

## See Also

- [core.md](core.md) — basics, scope functions, collections
- [null-safety.md](null-safety.md) — nullable types and safe calls