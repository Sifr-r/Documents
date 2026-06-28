# Go — Common Patterns

## Functional Options

Avoid constructor explosion by using variadic option functions.

```go
type Server struct {
    host    string
    port    int
    timeout time.Duration
    maxConn int
}

type Option func(*Server)

func WithHost(host string) Option {
    return func(s *Server) { s.host = host }
}

func WithPort(port int) Option {
    return func(s *Server) { s.port = port }
}

func WithTimeout(d time.Duration) Option {
    return func(s *Server) { s.timeout = d }
}

func WithMaxConn(n int) Option {
    return func(s *Server) { s.maxConn = n }
}

func NewServer(opts ...Option) *Server {
    s := &Server{
        host:    "localhost",
        port:    8080,
        timeout: 30 * time.Second,
        maxConn: 100,
    }
    for _, opt := range opts {
        opt(s)
    }
    return s
}

// Usage
s := NewServer(
    WithPort(9090),
    WithTimeout(60 * time.Second),
)
```

## Middleware Pattern

```go
type Handler func(ctx context.Context, req *Request) (*Response, error)
type Middleware func(Handler) Handler

// Logging middleware
func LoggingMiddleware(next Handler) Handler {
    return func(ctx context.Context, req *Request) (*Response, error) {
        start := time.Now()
        resp, err := next(ctx, req)
        log.Printf("%s %s %v", req.Method, req.Path, time.Since(start))
        return resp, err
    }
}

// Chain
func Chain(h Handler, middlewares ...Middleware) Handler {
    for i := len(middlewares) - 1; i >= 0; i-- {
        h = middlewares[i](h)
    }
    return h
}

handler := Chain(myHandler, LoggingMiddleware, AuthMiddleware, RecoverMiddleware)
```

## Error Handling Patterns

```go
// Sentinel errors
var ErrNotFound = errors.New("not found")
if errors.Is(err, ErrNotFound) { ... }

// Error wrapping with context
if err != nil {
    return fmt.Errorf("processUser: %w", err)
}

// Joining errors (1.20+)
err1 := errors.New("first")
err2 := errors.New("second")
combined := errors.Join(err1, err2)
// errors.Is(combined, err1) == true
```

## Worker Pool

```go
func workerPool(ctx context.Context, jobs <-chan Job, results chan<- Result, numWorkers int) {
    var wg sync.WaitGroup
    for i := 0; i < numWorkers; i++ {
        wg.Add(1)
        go func() {
            defer wg.Done()
            for {
                select {
                case <-ctx.Done():
                    return
                case job, ok := <-jobs:
                    if !ok { return }
                    result := process(job)
                    select {
                    case results <- result:
                    case <-ctx.Done():
                        return
                    }
                }
            }
        }()
    }
    go func() { wg.Wait(); close(results) }()
}
```

## errgroup (golang.org/x/sync/errgroup)

Run goroutines and collect the first error.

```go
g, ctx := errgroup.WithContext(ctx)

g.Go(func() error {
    return fetchURL(ctx, "url1")
})
g.Go(func() error {
    return fetchURL(ctx, "url2")
})

if err := g.Wait(); err != nil {
    log.Fatal(err)
}
```

## Table-Driven Tests

```go
func TestAdd(t *testing.T) {
    tests := []struct {
        name     string
        a, b     int
        expected int
    }{
        {"positive", 1, 2, 3},
        {"negative", -1, -2, -3},
        {"zero", 0, 5, 5},
    }

    for _, tt := range tests {
        t.Run(tt.name, func(t *testing.T) {
            result := Add(tt.a, tt.b)
            if result != tt.expected {
                t.Errorf("Add(%d, %d) = %d, want %d",
                    tt.a, tt.b, result, tt.expected)
            }
        })
    }
}
```

## Graceful Shutdown

```go
func main() {
    srv := &http.Server{Addr: ":8080"}

    // Run server in goroutine
    go func() {
        if err := srv.ListenAndServe(); err != http.ErrServerClosed {
            log.Fatal(err)
        }
    }()

    // Wait for interrupt signal
    quit := make(chan os.Signal, 1)
    signal.Notify(quit, syscall.SIGINT, syscall.SIGTERM)
    <-quit

    // Graceful shutdown with timeout
    ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
    defer cancel()
    if err := srv.Shutdown(ctx); err != nil {
        log.Fatal(err)
    }
}
```

## See Also

- [core.md](core.md) — error handling, defer
- [concurrency.md](concurrency.md) — goroutine patterns, channels
- [interfaces.md](interfaces.md) — interface design
