# Flask

Flask 3+ is a lightweight WSGI web application framework for Python. It is designed to make getting started quick and easy, with the ability to scale up to complex applications through extensions.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Application setup, routing, request/response, Jinja2 templates, blueprints, extensions, error handling, context, configuration, and testing |

## Quick Reference

### Minimal App

```python
from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def index():
    return jsonify({"message": "Hello, Flask!"})

if __name__ == "__main__":
    app.run(debug=True)
```

### Routing

```python
@app.route("/users/<int:user_id>")
def get_user(user_id):
    return f"User {user_id}"

@app.route("/search")
def search():
    q = request.args.get("q", "")
    return f"Search: {q}"
```

### Request and Response

```python
from flask import request, jsonify, make_response

@app.route("/api/data", methods=["POST"])
def create():
    data = request.get_json()
    resp = make_response(jsonify(data), 201)
    resp.headers["X-Custom"] = "value"
    return resp
```

### Blueprints

```python
from flask import Blueprint

auth_bp = Blueprint("auth", __name__, url_prefix="/auth")

@auth_bp.route("/login", methods=["POST"])
def login():
    return jsonify({"token": "abc123"})
```

### Session and g

```python
from flask import session, g

@app.before_request
def load_user():
    g.user = get_current_user()

@app.route("/set-lang/<lang>")
def set_lang(lang):
    session["language"] = lang
    return "Language set"
```

### Running

```bash
flask --app app run --debug --port 5000
flask --app app run --host 0.0.0.0
```

### Templates

```python
from flask import render_template

@app.route("/hello/<name>")
def hello(name):
    return render_template("hello.html", name=name)
```

```html
<h1>Hello, {{ name }}!</h1>
```

## See Also

- [Flask Documentation](https://flask.palletsprojects.com/en/latest/)
- [Flask GitHub](https://github.com/pallets/flask)
- [Flask Extensions](https://flask.palletsprojects.com/en/latest/extensions/)
