# Testing

## Test Pyramid

```
     ┌──────┐
     │ E2E  │  ← Few: critical user journeys
    ┌┴──────┴┐
    │ Integration│ ← Some: API contracts, DB, external services
   ┌┴──────────┴┐
   │    Unit     │ ← Many: functions, methods, pure logic
  └──────────────┘
```

## Unit Tests

Test individual functions/methods in isolation. Fast, reliable, many.

```python
# Python (pytest)
def test_add():
    assert add(1, 2) == 3

def test_divide_by_zero():
    with pytest.raises(ZeroDivisionError):
        divide(1, 0)

@pytest.mark.parametrize("a,b,expected", [
    (1, 2, 3),
    (-1, 1, 0),
    (0, 0, 0),
])
def test_add_parametrized(a, b, expected):
    assert add(a, b) == expected
```

```go
// Go (testing package)
func TestAdd(t *testing.T) {
    result := Add(1, 2)
    if result != 3 {
        t.Errorf("Add(1, 2) = %d; want 3", result)
    }
}

func TestAddTable(t *testing.T) {
    tests := []struct{ a, b, want int }{
        {1, 2, 3},
        {-1, 1, 0},
    }
    for _, tt := range tests {
        t.Run(fmt.Sprintf("%d+%d", tt.a, tt.b), func(t *testing.T) {
            if got := Add(tt.a, tt.b); got != tt.want {
                t.Errorf("got %d, want %d", got, tt.want)
            }
        })
    }
}
```

## Integration Tests

Test multiple components together: API endpoints, database queries, service interactions.

```python
# FastAPI + httpx (async)
async def test_create_user(async_client):
    response = await async_client.post("/users", json={
        "name": "Ada", "email": "ada@example.com"
    })
    assert response.status_code == 201
    data = response.json()
    assert data["name"] == "Ada"
```

```go
func TestCreateUser(t *testing.T) {
    // Setup test DB
    db := setupTestDB(t)
    defer db.Close()

    handler := NewUserHandler(db)
    req := httptest.NewRequest("POST", "/users", strings.NewReader(
        `{"name":"Ada","email":"ada@example.com"}`,
    ))
    w := httptest.NewRecorder()
    handler.ServeHTTP(w, req)

    assert.Equal(t, 201, w.Code)
}
```

## Mocking & Stubs

```python
# Python (unittest.mock)
from unittest.mock import Mock, patch

def test_send_email():
    mock_sender = Mock()
    mock_sender.send.return_value = True

    notify(mock_sender, "ada@example.com", "Hello")
    mock_sender.send.assert_called_once_with(
        "ada@example.com", "Hello"
    )

# Patch external dependency
@patch("mymodule.requests.get")
def test_fetch_user(mock_get):
    mock_get.return_value.json.return_value = {"name": "Ada"}
    user = fetch_user("http://api/users/1")
    assert user["name"] == "Ada"
```

```go
// Go — use interfaces for testability
type EmailSender interface {
    Send(to, body string) error
}

type MockSender struct {
    SentTo   string
    SentBody string
}

func (m *MockSender) Send(to, body string) error {
    m.SentTo = to
    m.SentBody = body
    return nil
}

func TestNotify(t *testing.T) {
    sender := &MockSender{}
    Notify(sender, "ada@example.com", "Hello")
    assert.Equal(t, "ada@example.com", sender.SentTo)
}
```

## Fixtures & Setup/Teardown

```python
# pytest fixtures
@pytest.fixture
def db():
    """Create test database, clean up after test."""
    conn = create_test_db()
    yield conn
    conn.close()
    drop_test_db()

def test_query(db):
    result = db.execute("SELECT 1")
    assert result == 1
```

## Property-Based Testing

Generate random inputs to find edge cases.

```python
# hypothesis
from hypothesis import given, strategies as st

@given(st.integers(), st.integers())
def test_add_commutative(a, b):
    assert add(a, b) == add(b, a)

@given(st.lists(st.integers()))
def test_sort_idempotent(lst):
    assert sorted(sorted(lst)) == sorted(lst)
```

## Snapshot Testing

Capture output and compare on subsequent runs. Good for UI, API responses.

```python
def test_user_card(snapshot):
    card = render_user_card(User("Ada", "ada@example.com"))
    snapshot.assert_match(card, "user_card.txt")
```

## Test Naming

```python
# Good — describes behavior and expected outcome
def test_transfer_insufficient_funds_raises_error():
    ...

def test_login_with_expired_token_returns_401():
    ...

# Bad
def test_transfer():
    ...

def test_login():
    ...
```
