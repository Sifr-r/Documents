# Gin

Gin is a high-performance HTTP web framework for Go. It features a fast router, middleware support, and JSON validation, making it ideal for building RESTful APIs.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Router setup, context, middleware, binding/validation, rendering, file upload, error handling, and testing |

## Quick Reference

### Minimal App

```go
package main

import "github.com/gin-gonic/gin"

func main() {
    r := gin.Default()

    r.GET("/", func(c *gin.Context) {
        c.JSON(200, gin.H{"message": "Hello, Gin!"})
    })

    r.Run(":8080")
}
```

### Routing

```go
r.GET("/users/:id", getUser)
r.POST("/users", createUser)
r.PUT("/users/:id", updateUser)
r.DELETE("/users/:id", deleteUser)
```

### Context

```go
func getUser(c *gin.Context) {
    id := c.Param("id")              // Route param
    page := c.DefaultQuery("page", "1") // Query param
    c.JSON(200, gin.H{"id": id, "page": page})
}
```

### Middleware

```go
r := gin.Default() // Logger + Recovery included

r.Use(func(c *gin.Context) {
    fmt.Println("Before request")
    c.Next()
    fmt.Println("After request")
})
```

### Binding

```go
func createUser(c *gin.Context) {
    var input CreateUserInput
    if err := c.ShouldBindJSON(&input); err != nil {
        c.JSON(400, gin.H{"error": err.Error()})
        return
    }
    c.JSON(201, input)
}
```

## See Also

- [Gin Documentation](https://gin-gonic.com/docs/)
- [Gin GitHub](https://github.com/gin-gonic/gin)
- [Gin Examples](https://github.com/gin-gonic/examples)
