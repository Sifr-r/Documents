# Actix Web

Actix Web 4 is a powerful, high-performance web framework for Rust. It leverages the Actix actor framework and provides async handlers, extractors, middleware, and a type-safe routing system.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | App setup, routing, handlers/extractors, state, middleware, error handling, JSON, file serving, WebSockets, and testing |

## Quick Reference

### Minimal App

```rust
use actix_web::{web, App, HttpServer, HttpResponse};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/", web::get().to(index))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}

async fn index() -> HttpResponse {
    HttpResponse::Ok().json(serde_json::json!({"message": "Hello, Actix!"}))
}
```

### Routing with Macros

```rust
use actix_web::{get, post, web, HttpResponse, Responder};

#[get("/")]
async fn index() -> impl Responder {
    HttpResponse::Ok().body("Hello!")
}

#[post("/users")]
async fn create_user(body: web::Json<CreateUser>) -> impl Responder {
    HttpResponse::Created().json(body.into_inner())
}
```

### Extractors

```rust
async fn get_user(path: web::Path<u32>) -> impl Responder {
    let id = path.into_inner();
    HttpResponse::Ok().json(serde_json::json!({"id": id}))
}
```

### Middleware

```rust
use actix_web::middleware::Logger;

App::new().wrap(Logger::default())
```

## See Also

- [Actix Web Documentation](https://actix.rs/docs/)
- [Actix Web GitHub](https://github.com/actix/actix-web)
- [Actix Examples](https://github.com/actix/examples)
