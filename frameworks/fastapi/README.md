# FastAPI

FastAPI is a modern, high-performance web framework for building APIs with Python 3.7+ based on standard Python type hints. It features automatic API documentation, data validation via Pydantic, and native async support.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Path operations, Pydantic models, dependency injection, parameters, middleware, background tasks, WebSocket, security, testing, and async |

## Quick Reference

### Minimal App

```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello, FastAPI!"}
```

```bash
uvicorn main:app --reload --port 8000
```

### Path Operations

```python
from fastapi import Query, Path

@app.get("/items/{item_id}")
async def get_item(
    item_id: int = Path(..., gt=0, description="The item ID"),
    q: str | None = Query(None, max_length=50),
):
    return {"item_id": item_id, "q": q}
```

### Pydantic Models

```python
from pydantic import BaseModel, Field

class ItemCreate(BaseModel):
    name: str = Field(..., min_length=1, max_length=100)
    price: float = Field(..., gt=0)
    description: str | None = None

class Item(ItemCreate):
    id: int

@app.post("/items/", response_model=Item)
async def create_item(item: ItemCreate):
    return item
```

### Dependency Injection

```python
from fastapi import Depends

async def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/users/")
async def read_users(db: Session = Depends(get_db)):
    return db.query(User).all()
```

### Response Model

```python
@app.get("/users/{user_id}", response_model=User)
async def read_user(user_id: int):
    return get_user(user_id)

@app.get("/items/", response_model=list[Item])
async def list_items():
    return get_items()
```

### HTTP Exceptions

```python
from fastapi import HTTPException

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    item = get_item(item_id)
    if not item:
        raise HTTPException(status_code=404, detail="Item not found")
    return item
```

## See Also

- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [FastAPI GitHub](https://github.com/tiangolo/fastapi)
- [Pydantic Documentation](https://docs.pydantic.dev/)
- [Starlette Documentation](https://www.starlette.io/)
