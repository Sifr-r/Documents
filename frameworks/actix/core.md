# Actix Web — Core

## App Setup

```rust
use actix_web::{web, App, HttpServer};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/", web::get().to(index))
            .route("/users", web::get().to(list_users))
            .route("/users", web::post().to(create_user))
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
```

### Configuration

```rust
use actix_web::{web, App, HttpServer};

fn config(cfg: &mut web::ServiceConfig) {
    cfg.service(
        web::scope("/api")
            .route("/users", web::get().to(list_users))
            .route("/users/{id}", web::get().to(get_user)),
    );
}

HttpServer::new(|| App::new().configure(config))
    .bind("127.0.0.1:8080")?
    .run()
    .await
```

## Routing

### Attribute Macros

```rust
use actix_web::{get, post, put, delete, web, HttpResponse, Responder};

#[get("/")]
async fn index() -> impl Responder {
    HttpResponse::Ok().body("Hello")
}

#[post("/users")]
async fn create_user(body: web::Json<CreateUser>) -> impl Responder {
    HttpResponse::Created().json(body.into_inner())
}

#[put("/users/{id}")]
async fn update_user(path: web::Path<u32>, body: web::Json<UpdateUser>) -> impl Responder {
    HttpResponse::Ok().json(body.into_inner())
}

#[delete("/users/{id}")]
async fn delete_user(path: web::Path<u32>) -> impl Responder {
    HttpResponse::NoContent().finish()
}

// Register
App::new().service(index).service(create_user).service(update_user).service(delete_user)
```

### Route and Resource

```rust
App::new()
    .route("/hello", web::get().to(hello_handler))
    .resource("/users")
        .route(web::get().to(list_users))
        .route(web::post().to(create_user))
    .resource("/users/{id}")
        .route(web::get().to(get_user))
```

### Route Parameters

```rust
#[get("/users/{id}/posts/{post_id}")]
async fn get_post(path: web::Path<(u32, u32)>) -> impl Responder {
    let (user_id, post_id) = path.into_inner();
    HttpResponse::Ok().json(serde_json::json!({"user_id": user_id, "post_id": post_id}))
}
```

## Handlers and Extractors

```rust
use actix_web::{web, HttpRequest, HttpResponse, Responder};
use serde::Deserialize;

// Path extractor
async fn get_user(path: web::Path<u32>) -> impl Responder {
    HttpResponse::Ok().json(serde_json::json!({"id": path.into_inner()}))
}

// Query extractor
#[derive(Deserialize)]
struct Pagination { page: Option<u32>, limit: Option<u32> }

async fn list_users(query: web::Query<Pagination>) -> impl Responder {
    HttpResponse::Ok().json(serde_json::json!({"page": query.page.unwrap_or(1)}))
}

// JSON body extractor
#[derive(Deserialize)]
struct CreateUser { name: String, email: String }

async fn create_user(body: web::Json<CreateUser>) -> impl Responder {
    HttpResponse::Created().json(body.into_inner())
}

// Form extractor
async fn login(form: web::Form<LoginForm>) -> impl Responder {
    HttpResponse::Ok().body("Logged in")
}

// Raw request
async fn raw_handler(req: HttpRequest, body: web::Bytes) -> impl Responder {
    HttpResponse::Ok().body(body)
}
```

## State

```rust
use actix_web::web::Data;
use std::sync::Mutex;

struct AppState {
    counter: Mutex<u32>,
}

#[get("/count")]
async fn count(data: Data<AppState>) -> impl Responder {
    let mut c = data.counter.lock().unwrap();
    *c += 1;
    HttpResponse::Ok().json(serde_json::json!({"count": *c}))
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let data = Data::new(AppState { counter: Mutex::new(0) });

    HttpServer::new(move || {
        App::new()
            .app_data(data.clone())
            .service(count)
    })
    .bind("127.0.0.1:8080")?
    .run()
    .await
}
```

## Middleware

### Built-in

```rust
use actix_web::middleware::{Logger, DefaultHeaders, Compress};

App::new()
    .wrap(Logger::default())
    .wrap(DefaultHeaders::new().add(("X-Version", "1.0")))
    .wrap(Compress::default())
```

### Custom Middleware

```rust
use actix_web::dev::{ServiceRequest, ServiceResponse, Transform, Service};
use std::future::{Ready, ready};

pub struct SayHi;

impl<S, B> Transform<S, ServiceRequest> for SayHi
where S: Service<ServiceRequest, Response = ServiceResponse<B>, Error = actix_web::Error>,
{
    type Response = ServiceResponse<B>;
    type Error = actix_web::Error;
    type Transform = SayHiMiddleware<S>;
    type InitError = ();
    type Future = Ready<Result<Self::Transform, Self::InitError>>;

    fn new_transform(&self, service: S) -> Self::Future {
        ready(Ok(SayHiMiddleware { service }))
    }
}

pub struct SayHiMiddleware<S> { service: S }
// Implement Service trait for SayHiMiddleware...
```

## Error Handling

```rust
use actix_web::{ResponseError, HttpResponse};
use std::fmt;
use derive_more::Display;

#[derive(Debug, Display)]
enum AppError {
    #[display("Not found: {_0}")]
    NotFound(String),
    #[display("Bad request: {_0}")]
    BadRequest(String),
}

impl ResponseError for AppError {
    fn error_response(&self) -> HttpResponse {
        match self {
            AppError::NotFound(msg) => HttpResponse::NotFound().json(serde_json::json!({"error": msg})),
            AppError::BadRequest(msg) => HttpResponse::BadRequest().json(serde_json::json!({"error": msg})),
        }
    }
}
```

## JSON Serialization

```rust
use actix_web::{web, HttpResponse};
use serde::{Deserialize, Serialize};

#[derive(Deserialize, Serialize)]
struct User { id: u32, name: String, email: String }

#[post("/users")]
async fn create_user(user: web::Json<User>) -> HttpResponse {
    HttpResponse::Created().json(user.into_inner())
}

// Custom JSON config
App::new().app_data(web::JsonConfig::default().limit(4096))
```

## File Serving

```rust
use actix_files::NamedFile;

#[get("/files/{filename}")]
async fn serve_file(path: web::Path<String>) -> actix_web::Result<NamedFile> {
    let file = NamedFile::open(format!("./uploads/{}", path.into_inner()))?;
    Ok(file)
}

// Static files
use actix_files::Files;

App::new().service(Files::new("/static", "./static").show_files_listing())
```

## WebSockets

```rust
use actix_web_actors::ws;

struct MyWebSocket;

impl Actor for MyWebSocket {
    type Context = ws::WebsocketContext<Self>;
}

impl StreamHandler<Result<ws::Message, ws::ProtocolError>> for MyWebSocket {
    fn handle(&mut self, msg: Result<ws::Message, ws::ProtocolError>, ctx: &mut Self::Context) {
        if let Ok(ws::Message::Text(text)) = msg {
            ctx.text(format!("Echo: {}", text));
        }
    }
}

// Register
#[get("/ws")]
async fn ws_index(req: HttpRequest, stream: web::Payload) -> actix_web::Result<HttpResponse> {
    ws::start(MyWebSocket, &req, stream)
}
```

## Testing

```rust
use actix_web::{test, web, App};

#[actix_web::test]
async fn test_index() {
    let app = test::init_service(App::new().route("/", web::get().to(index))).await;
    let req = test::TestRequest::get().uri("/").to_request();
    let resp = test::call_service(&app, req).await;
    assert!(resp.status().is_success());
}

#[actix_web::test]
async fn test_create_user() {
    let app = test::init_service(App::new().service(create_user)).await;
    let req = test::TestRequest::post()
        .uri("/users")
        .set_json(serde_json::json!({"name": "Alice", "email": "a@b.com"}))
        .to_request();
    let resp = test::call_service(&app, req).await;
    assert_eq!(resp.status(), 201);
}
```

## See Also

- [Actix Web Documentation](https://actix.rs/docs/)
- [Actix Web API Reference](https://docs.rs/actix-web/)
- [Actix Web GitHub](https://github.com/actix/actix-web)
- [Actix Examples](https://github.com/actix/examples)
