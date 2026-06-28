# Java — Concurrency

## Virtual Threads (Java 21+)

Lightweight threads managed by the JVM, not the OS. Millions of virtual threads can run on a few platform threads.

```java
// Create and start
Thread vt = Thread.startVirtualThread(() -> {
    System.out.println("Running in virtual thread");
});

// Via executor
try (var executor = Executors.newVirtualThreadPerTaskExecutor()) {
    executor.submit(() -> fetchUrl(url));
    executor.submit(() -> processData());
}
// executor.close() blocks until all tasks complete

// Structured concurrency (Java 21, preview → 23 stable)
try (var scope = new StructuredTaskScope.ShutdownOnFailure()) {
    var user = scope.fork(() -> fetchUser());
    var order = scope.fork(() -> fetchOrder());
    scope.join().throwIfFailed();
    return new Result(user.get(), order.get());
}
```

## ExecutorService

```java
var executor = Executors.newFixedThreadPool(4);

// Submit tasks
Future<String> future = executor.submit(() -> {
    Thread.sleep(1000);
    return "done";
});

// Invoke all
List<Callable<String>> tasks = List.of(task1, task2, task3);
List<Future<String>> results = executor.invokeAll(tasks);

// Invoke any (first to complete)
String first = executor.invokeAny(tasks);

// Shutdown
executor.shutdown();
executor.awaitTermination(10, TimeUnit.SECONDS);
executor.shutdownNow(); // force stop
```

## CompletableFuture

```java
// Creation
CompletableFuture<String> cf = CompletableFuture.supplyAsync(() -> {
    return heavyComputation();
});
CompletableFuture<Void> cf = CompletableFuture.runAsync(() -> doWork());

// Chaining
cf.thenApply(String::toUpperCase)       // map
  .thenAccept(System.out::println)      // consume
  .thenRun(() -> log("done"))           // run after
  .thenCompose(this::anotherAsync)      // flatMap
  .thenCombine(other, this::merge)      // zip
  .exceptionally(e -> "fallback")       // recover
  .completeOnTimeout("default", 5, TimeUnit.SECONDS); // Java 9+

// Waiting
cf.join();                    // like get() but unchecked
CompletableFuture.allOf(cf1, cf2, cf3).join();
CompletableFuture.anyOf(cf1, cf2, cf3).join();
```

## Synchronization

```java
// synchronized block
private final Object lock = new Object();
synchronized (lock) {
    // critical section
}

// synchronized method
public synchronized void increment() { count++; }

// ReentrantLock (more flexible)
private final Lock lock = new ReentrantLock();
lock.lock();
try {
    // critical section
} finally {
    lock.unlock();
}

// ReadWriteLock
var rwLock = new ReentrantReadWriteLock();
rwLock.readLock().lock();   // concurrent reads
rwLock.writeLock().lock();  // exclusive write
```

## Atomic Classes

```java
AtomicInteger counter = new AtomicInteger(0);
counter.incrementAndGet();
counter.decrementAndGet();
counter.addAndGet(5);
counter.compareAndSet(expected, newValue); // CAS

AtomicReference<String> ref = new AtomicReference<>("old");
ref.compareAndSet("old", "new");
ref.updateAndGet(String::toUpperCase);

// Accumulators (Java 8+, better for high contention)
LongAdder adder = new LongAdder();
adder.increment();
adder.sum();  // global, not just snapshot
```

## Thread-Safe Collections

```java
// Concurrent map
var map = new ConcurrentHashMap<String, Integer>();
map.put("key", 1);
map.computeIfAbsent("key", k -> 0);
map.merge("key", 1, Integer::sum);

// Copy-on-write (read-heavy, few writes)
var list = new CopyOnWriteArrayList<String>();
list.add("a");

// Blocking queues (producer-consumer)
var queue = new LinkedBlockingQueue<String>(100);
queue.put("item");   // blocks if full
queue.take();        // blocks if empty
queue.poll(1, TimeUnit.SECONDS); // timeout
```

## ThreadLocal

```java
private static final ThreadLocal<String> context = new ThreadLocal<>();
context.set("value");
String val = context.get();
context.remove(); // always clean up!
```

## See Also

- [core.md](core.md) — syntax, collections
- [streams.md](streams.md) — parallel streams