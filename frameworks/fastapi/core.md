# FastAPI — Core

## Path Operations

```python
from fastapi import FastAPI, status

app = FastAPI(title="My API", version="1.0.0")

@app.get("/")
async def root():
    return {"message": "Hello"}

@app.post("/items/", status_code=status.HTTP_201_CREATED)
async def create_item():
    return {"id": 1}

@app.put("/items/{item_id}")
async def update_item(item_id: int):
    return {"item_id": item_id, "updated": True}

@app.patch("/items/{item_id}")
async def patch_item(item_id: int):
    return {"item_id": item_id, "patched": True}

@app.delete("/items/{item_id}", status_code=status.HTTP_204_NO_CONTENT)
async def delete_item(item_id: int):
    pass
```

## Parameters

### Path Parameters

```python
from fastapi import Path

@app.get("/items/{item_id}")
async def read_item(
    item_id: int = Path(..., gt=0, le=1000, title="Item ID", description="The ID of the item"),
):
    return {"item_id": item_id}

@app.get("/files/{file_path:path}")
async def read_file(file_path: str):
    return {"path": file_path}
```

### Query Parameters

```python
from fastapi import Query

@app.get("/items/")
async def list_items(
    skip: int = Query(0, ge=0),
    limit: int = Query(10, ge=1, le=100),
    q: str | None = Query(None, max_length=50, description="Search query"),
    tags: list[str] = Query([], description="Filter by tags"),
):
    return {"skip": skip, "limit": limit, "q": q, "tags": tags}
```

### Body Parameters

```python
from fastapi import Body
from pydantic import BaseModel

class ItemUpdate(BaseModel):
    name: str | None = None
    price: float | None = None

@app.put("/items/{item_id}")
async def update_item(
    item_id: int,
    item: ItemUpdate,
    importance: int = Body(..., ge=1, le=10),
):
    return {"item_id": item_id, "item": item, "importance": importance}
```

## Pydantic Models and Validation

```python
from pydantic import BaseModel, Field, field_validator, EmailStr
from datetime import datetime

class UserCreate(BaseModel):
    username: str = Field(..., min_length=3, max_length=50)
    email: EmailStr
    password: str = Field(..., min_length=8)
    age: int = Field(..., ge=0, le=150)

    @field_validator("username")
    @classmethod
    def username_alphanumeric(cls, v: str) -> str:
        if not v.isalnum():
            raise ValueError("Username must be alphanumeric")
        return v

class UserResponse(BaseModel):
    id: int
    username: str
    email: str
    created_at: datetime

    model_config = {"from_attributes": True}

class PaginatedResponse(BaseModel):
    items: list[UserResponse]
    total: int
    page: int
    size: int
```

## Dependency Injection

```python
from fastapi import Depends, HTTPException, Header

# Simple dependency
async def common_parameters(
    skip: int = 0, limit: int = 100, q: str | None = None
):
    return {"skip": skip, "limit": limit, "q": q}

@app.get("/items/")
async def list_items(params: dict = Depends(common_parameters)):
    return params

# Dependency with yield (cleanup)
async def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Dependency with security
async def verify_token(x_token: str = Header(...)):
    if x_token != "secret":
        raise HTTPException(status_code=403, detail="Invalid token")

@app.get("/protected/", dependencies=[Depends(verify_token)])
async def protected():
    return {"data": "secret"}

# Class-based dependency
class Pagination:
    def __init__(self, page: int = 1, size: int = 20):
        self.page = page
        self.size = size
        self.offset = (page - 1) * size

@app.get("/items/")
async def list_items(pagination: Pagination = Depends()):
    return {"page": pagination.page, "offset": pagination.offset}
```

## Request and Response Models

```python
from fastapi import Request
from fastapi.responses import JSONResponse, HTMLResponse, RedirectResponse

@app.post("/items/", response_model=ItemResponse, response_model_exclude={"password"})
async def create_item(item: ItemCreate):
    return save_item(item)

@app.get("/items/{item_id}", responses={
    200: {"description": "Successful response"},
    404: {"description": "Item not found"},
})
async def read_item(item_id: int):
    item = get_item(item_id)
    if not item:
        return JSONResponse(status_code=404, content={"detail": "Not found"})
    return item

@app.get("/html", response_class=HTMLResponse)
async def html():
    return "<h1>Hello</h1>"
```

## Middleware

```python
from fastapi import Request
from fastapi.middleware.cors import CORSMiddleware
import time

# CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:3000"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Custom middleware
@app.middleware("http")
async def add_timing_header(request: Request, call_next):
    start = time.time()
    response = await call_next(request)
    duration = time.time() - start
    response.headers["X-Process-Time"] = str(duration)
    return response
```

## Background Tasks

```python
from fastapi import BackgroundTasks

def send_email(to: str, subject: str):
    # Slow email sending
    pass

@app.post("/register/")
async def register(user: UserCreate, bg: BackgroundTasks):
    save_user(user)
    bg.add_task(send_email, user.email, "Welcome!")
    return {"message": "User created"}
```

## WebSocket

```python
from fastapi import WebSocket, WebSocketDisconnect

class ConnectionManager:
    def __init__(self):
        self.active: list[WebSocket] = []

    async def connect(self, ws: WebSocket):
        await ws.accept()
        self.active.append(ws)

    async def broadcast(self, message: str):
        for conn in self.active:
            await conn.send_text(message)

manager = ConnectionManager()

@app.websocket("/ws/{client_id}")
async def websocket_endpoint(websocket: WebSocket, client_id: str):
    await manager.connect(websocket)
    try:
        while True:
            data = await websocket.receive_text()
            await manager.broadcast(f"{client_id}: {data}")
    except WebSocketDisconnect:
        manager.active.remove(websocket)
```

## Security

### OAuth2 with JWT

```python
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from jose import jwt, JWTError
from datetime import datetime, timedelta

SECRET_KEY = "your-secret-key"
ALGORITHM = "HS256"
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="token")

def create_token(data: dict, expires_delta: timedelta = timedelta(hours=1)):
    to_encode = data.copy()
    to_encode["exp"] = datetime.utcnow() + expires_delta
    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)

async def get_current_user(token: str = Depends(oauth2_scheme)):
    try:
        payload = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username: str = payload.get("sub")
        if username is None:
            raise HTTPException(status_code=401, detail="Invalid token")
        return get_user(username)
    except JWTError:
        raise HTTPException(status_code=401, detail="Invalid token")

@app.post("/token")
async def login(form_data: OAuth2PasswordRequestForm = Depends()):
    user = authenticate(form_data.username, form_data.password)
    token = create_token({"sub": user.username})
    return {"access_token": token, "token_type": "bearer"}

@app.get("/me")
async def me(user=Depends(get_current_user)):
    return user
```

## Testing

```python
from fastapi.testclient import TestClient

client = TestClient(app)

def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello"}

def test_create_item():
    response = client.post("/items/", json={"name": "Widget", "price": 9.99})
    assert response.status_code == 201

def test_auth():
    # Get token
    response = client.post("/token", data={
        "username": "admin", "password": "secret"
    })
    token = response.json()["access_token"]
    # Use token
    response = client.get("/me", headers={"Authorization": f"Bearer {token}"})
    assert response.status_code == 200
```

## Async Support

```python
import asyncio
import httpx

# Async path operation
@app.get("/data/")
async def fetch_data():
    async with httpx.AsyncClient() as client:
        response = await client.get("https://api.example.com/data")
    return response.json()

# Sync path operation (runs in thread pool)
@app.get("/sync/")
def sync_endpoint():
    result = slow_blocking_operation()
    return {"result": result}

# Concurrent requests
@app.get("/multi/")
async def multi_fetch():
    async with httpx.AsyncClient() as client:
        r1, r2 = await asyncio.gather(
            client.get("https://api1.example.com"),
            client.get("https://api2.example.com"),
        )
    return [r1.json(), r2.json()]
```

## See Also

- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [FastAPI Tutorial](https://fastapi.tiangolo.com/tutorial/)
- [Pydantic V2 Documentation](https://docs.pydantic.dev/)
- [Starlette Documentation](https://www.starlette.io/)
