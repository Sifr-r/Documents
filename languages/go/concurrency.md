# Go — Concurrency

## Goroutines

A goroutine is a lightweight thread managed by the Go runtime.

```go
go func() {
    // runs concurrently
    fmt.Println("goroutine")
}()

// Wait for completion
var wg sync.WaitGroup
for i := 0; i < 5; i++ {
    wg.Add(1)
    go func(id int) {
        defer wg.Done()
        fmt.Println(id)
    }(i) // pass i — avoid closure over loop variable
}
wg.Wait()
```

## Channels

```go
// Unbuffered (synchronous — blocks until other side ready)
ch := make(chan int)

// Buffered (async up to capacity)
ch := make(chan string, 10)

// Send and receive
ch <- 42       // send
val := <-ch    // receive
val, ok := <-ch // receive with check (ok=false if closed)

// Directional channels (for type safety)
func producer(out chan<- int) { // send-only
    out <- 42
}
func consumer(in <-chan int) {  // receive-only
    val := <-in
}

// Close
close(ch) // receiver gets zero value after drain
// NEVER send on closed channel → panic
// Closing twice → panic
```

## Select

Multiplex across multiple channel operations.

```go
select {
case msg := <-ch1:
    fmt.Println("from ch1:", msg)
case ch2 <- value:
    fmt.Println("sent to ch2")
case <-time.After(5 * time.Second):
    fmt.Println("timeout")
default:
    // non-blocking if no channel ready
}

// Loop with done channel
done := make(chan struct{})
go func() {
    for {
        select {
        case msg := <-ch:
            process(msg)
        case <-done:
            return
        }
    }
}()
close(done) // signal goroutine to stop
```

## Common Channel Patterns

```go
// Pipeline
func gen(nums ...int) <-chan int {
    out := make(chan int)
    go func() {
        for _, n := range nums {
            out <- n
        }
        close(out)
    }()
    return out
}

func square(in <-chan int) <-chan int {
    out := make(chan int)
    go func() {
        for n := range in {
            out <- n * n
        }
        close(out)
    }()
    return out
}

// Fan-out / fan-in
func fanIn(chs ...<-chan int) <-chan int {
    out := make(chan int)
    var wg sync.WaitGroup
    for _, ch := range chs {
        wg.Add(1)
        go func(c <-chan int) {
            defer wg.Done()
            for v := range c {
                out <- v
            }
        }(ch)
    }
    go func() { wg.Wait(); close(out) }()
    return out
}

// Or-Done (merge done signal)
func orDone(done <-chan struct{}, in <-chan int) <-chan int {
    out := make(chan int)
    go func() {
        defer close(out)
        for {
            select {
            case <-done:
                return
            case v, ok := <-in:
                if !ok { return }
                select {
                case out <- v:
                case <-done:
                }
            }
        }
    }()
    return out
}
```

## Sync Primitives

```go
// Mutex
var mu sync.Mutex
mu.Lock()
// critical section
mu.Unlock()

// RWMutex (multiple readers, single writer)
var mu sync.RWMutex
mu.RLock()   // shared lock
mu.RUnlock()
mu.Lock()    // exclusive lock
mu.Unlock()

// Once
var once sync.Once
once.Do(func() {
    // runs exactly once
})

// Atomic (lock-free counters)
var counter atomic.Int64
counter.Add(1)
val := counter.Load()
```

## Context

Context carries deadlines, cancellation, and request-scoped values.

```go
// Cancellation
ctx, cancel := context.WithCancel(context.Background())
defer cancel() // always call to prevent leak

// Timeout
ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
defer cancel()

// Deadline
ctx, cancel := context.WithDeadline(context.Background(), time.Now().Add(time.Minute))

// Values (use sparingly — only request-scoped data)
ctx = context.WithValue(ctx, keyUserID, "user-123")
userID := ctx.Value(keyUserID).(string)

// Checking cancellation
select {
case <-ctx.Done():
    return ctx.Err() // context.Canceled or context.DeadlineExceeded
default:
    // proceed
}
```

## See Also

- [core.md](core.md) — basic syntax, defer
- [interfaces.md](interfaces.md) — io.Reader/Writer patterns
- [patterns.md](patterns.md) — worker pools, errgroup
