# Gin — Core

## Router Setup

```go
package main

import "github.com/gin-gonic/gin"

func main() {
    // Default includes Logger and Recovery middleware
    r := gin.Default()

    // Or create without default middleware
    r := gin.New()
    r.Use(gin.Logger())
    r.Use(gin.Recovery())

    r.Run(":8080")           // Listen on :8080
    r.RunTLS(":443", "cert.pem", "key.pem") // HTTPS
}
```

### Routes

```go
r.GET("/users", listUsers)
r.POST("/users", createUser)
r.PUT("/users/:id", updateUser)
r.PATCH("/users/:id", patchUser)
r.DELETE("/users/:id", deleteUser)
r.OPTIONS("/users", optionsHandler)
r.HEAD("/users", headHandler)
r.Any("/any", anyHandler) // All methods
```

### Route Groups

```go
v1 := r.Group("/api/v1")
{
    v1.GET("/users", listUsers)
    v1.POST("/users", createUser)
}

v2 := r.Group("/api/v2")
{
    v2.GET("/users", listUsersV2)
}

// Group with middleware
admin := r.Group("/admin", authMiddleware)
{
    admin.GET("/dashboard", dashboardHandler)
}
```

## Context

### Parameters

```go
func handler(c *gin.Context) {
    // Route parameters
    id := c.Param("id")                     // /users/:id

    // Query parameters
    page := c.DefaultQuery("page", "1")     // ?page=2
    q := c.Query("q")                       // ?q=search

    // Form data
    name := c.PostForm("name")              // form field
    file, _ := c.FormFile("upload")         // uploaded file

    // Headers
    token := c.GetHeader("Authorization")
}
```

### Responses

```go
func handler(c *gin.Context) {
    // JSON
    c.JSON(200, gin.H{"key": "value"})
    c.JSON(200, map[string]any{"users": users})

    // String
    c.String(200, "Hello %s", "world")

    // XML
    c.XML(200, gin.H{"message": "hello"})

    // HTML
    c.HTML(200, "index.tmpl", gin.H{"title": "Home"})

    // Redirect
    c.Redirect(301, "/new-location")

    // Status only
    c.Status(204)

    // Data
    c.Data(200, "application/pdf", pdfBytes)

    // File
    c.File("report.pdf")
    c.FileAttachment("report.pdf", "report.pdf")
}
```

## Middleware

### Built-in Middleware

```go
r := gin.Default() // Includes gin.Logger() and gin.Recovery()

// Or add explicitly
r.Use(gin.Logger())
r.Use(gin.Recovery())
```

### Custom Middleware

```go
func authMiddleware(c *gin.Context) {
    token := c.GetHeader("Authorization")
    if token == "" {
        c.AbortWithStatusJSON(401, gin.H{"error": "unauthorized"})
        return
    }
    // Validate token...
    c.Set("userID", 42) // Store in context
    c.Next()
}

func corsMiddleware() gin.HandlerFunc {
    return func(c *gin.Context) {
        c.Header("Access-Control-Allow-Origin", "*")
        c.Header("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE")
        if c.Request.Method == "OPTIONS" {
            c.AbortWithStatus(204)
            return
        }
        c.Next()
    }
}

r.Use(authMiddleware)
r.Use(corsMiddleware())
```

## Binding and Validation

```go
type CreateUserInput struct {
    Name  string `json:"name" binding:"required,min=2,max=50"`
    Email string `json:"email" binding:"required,email"`
    Age   int    `json:"age" binding:"required,gte=0,lte=150"`
}

func createUser(c *gin.Context) {
    var input CreateUserInput
    if err := c.ShouldBindJSON(&input); err != nil {
        c.JSON(400, gin.H{"error": err.Error()})
        return
    }
    c.JSON(201, input)
}

// Bind query params
type ListQuery struct {
    Page  int `form:"page" binding:"min=1"`
    Limit int `form:"limit" binding:"min=1,max=100"`
}

func list(c *gin.Context) {
    var q ListQuery
    if err := c.ShouldBindQuery(&q); err != nil {
        c.JSON(400, gin.H{"error": err.Error()})
        return
    }
}
```

## Rendering

```go
// JSON
c.JSON(200, gin.H{"user": user})
c.IndentedJSON(200, user) // Pretty-printed

// XML
c.XML(200, gin.H{"user": user})

// YAML
c.YAML(200, gin.H{"user": user})

// HTML templates
r.LoadHTMLGlob("templates/*")
c.HTML(200, "index.tmpl", gin.H{
    "title": "Home",
    "items": items,
})

// ProtoBuf
c.ProtoBuf(200, &pb.UserResponse{Id: 1, Name: "Alice"})
```

## File Upload

```go
func uploadFile(c *gin.Context) {
    file, err := c.FormFile("file")
    if err != nil {
        c.JSON(400, gin.H{"error": err.Error()})
        return
    }
    c.SaveUploadedFile(file, "./uploads/"+file.Filename)
    c.JSON(200, gin.H{"filename": file.Filename})
}

// Multiple files
func uploadMultiple(c *gin.Context) {
    form, _ := c.MultipartForm()
    files := form.File["files"]
    for _, file := range files {
        c.SaveUploadedFile(file, "./uploads/"+file.Filename)
    }
}
```

## Error Handling

```go
// Custom error type
type AppError struct {
    Code    int    `json:"code"`
    Message string `json:"message"`
}

func (e *AppError) Error() string { return e.Message }

// Middleware to handle errors
func errorHandler() gin.HandlerFunc {
    return func(c *gin.Context) {
        c.Next()
        if len(c.Errors) > 0 {
            err := c.Errors.Last().Err
            if appErr, ok := err.(*AppError); ok {
                c.JSON(appErr.Code, appErr)
            }
        }
    }
}
```

## Testing

```go
import (
    "net/http"
    "net/http/httptest"
    "testing"

    "github.com/gin-gonic/gin"
    "github.com/stretchr/testify/assert"
)

func setupRouter() *gin.Engine {
    gin.SetMode(gin.TestMode)
    r := gin.New()
    r.GET("/ping", func(c *gin.Context) {
        c.JSON(200, gin.H{"message": "pong"})
    })
    return r
}

func TestPing(t *testing.T) {
    router := setupRouter()
    w := httptest.NewRecorder()
    req, _ := http.NewRequest("GET", "/ping", nil)
    router.ServeHTTP(w, req)

    assert.Equal(t, 200, w.Code)
    assert.Contains(t, w.Body.String(), "pong")
}
```

## See Also

- [Gin Documentation](https://gin-gonic.com/docs/)
- [Gin GitHub](https://github.com/gin-gonic/gin)
- [Gin Examples](https://github.com/gin-gonic/examples)
- [Go net/http](https://pkg.go.dev/net/http)
