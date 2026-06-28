# Flask — Core

## Application Setup

```python
from flask import Flask

app = Flask(__name__, static_folder="static", template_folder="templates")

# Configuration
app.config["SECRET_KEY"] = "dev-secret"
app.config["DATABASE_URI"] = "sqlite:///app.db"

if __name__ == "__main__":
    app.run(debug=True, port=5000)
```

### Application Factory

```python
from flask import Flask

def create_app(config_name="development"):
    app = Flask(__name__)
    app.config.from_object(config[config_name])

    # Register blueprints
    from .auth import auth_bp
    app.register_blueprint(auth_bp)

    # Initialize extensions
    db.init_app(app)

    return app
```

## Routing

```python
@app.route("/")
def index():
    return "Home"

@app.route("/user/<username>")
def profile(username):
    return f"{username}'s profile"

@app.route("/post/<int:post_id>")
def show_post(post_id):
    return f"Post {post_id}"

@app.route("/path/<path:subpath>")
def show_subpath(subpath):
    return f"Subpath: {subpath}"

# Multiple methods
@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        return do_login()
    return show_login_form()
```

Converters: `int`, `float`, `string` (default), `path`, `uuid`.

### url_for

```python
from flask import url_for

url_for("index")                      # "/"
url_for("profile", username="john")   # "/user/john"
url_for("static", filename="style.css")  # "/static/style.css"
```

## Request and Response

```python
from flask import request, jsonify, make_response, redirect, abort

@app.route("/api/items", methods=["POST"])
def create_item():
    # Request data
    data = request.get_json()              # JSON body
    name = request.form.get("name")        # Form data
    page = request.args.get("page", 1)     # Query params
    file = request.files.get("upload")     # File upload
    token = request.headers.get("Authorization")

    # Response
    response = make_response(jsonify({"id": 1, "name": data["name"]}), 201)
    response.headers["X-Custom"] = "value"
    return response

@app.route("/old-page")
def old_page():
    return redirect("/new-page", code=301)

@app.route("/protected")
def protected():
    abort(403)
```

## Templates (Jinja2)

```python
from flask import render_template, render_template_string

@app.route("/hello/<name>")
def hello(name):
    return render_template("hello.html", name=name, items=[1, 2, 3])
```

```html
{# templates/hello.html #}
{% extends "base.html" %}
{% block content %}
  <h1>Hello, {{ name|title }}!</h1>

  {% if items %}
    <ul>
    {% for item in items %}
      <li>{{ item }}</li>
    {% endfor %}
    </ul>
  {% else %}
    <p>No items.</p>
  {% endif %}

  {% include "partials/footer.html" %}
{% endblock %}
```

### Custom Filters

```python
@app.template_filter("reverse")
def reverse_filter(s):
    return s[::-1]
```

## Blueprints

```python
from flask import Blueprint

auth_bp = Blueprint("auth", __name__, url_prefix="/auth",
                    template_folder="templates",
                    static_folder="static")

@auth_bp.route("/login", methods=["GET", "POST"])
def login():
    return render_template("auth/login.html")

@auth_bp.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("index"))

@auth_bp.before_request
def require_login():
    if request.endpoint == "auth.login":
        return
    if "user_id" not in session:
        return redirect(url_for("auth.login"))

# Register in app
app.register_blueprint(auth_bp)
```

## Extensions

### Flask-SQLAlchemy

```python
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    posts = db.relationship("Post", backref="author", lazy=True)

class Post(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200), nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"))

# Usage
with app.app_context():
    db.create_all()
    users = User.query.filter_by(username="john").all()
```

### Flask-WTF

```python
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import DataRequired, Email

class LoginForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired(), Email()])
    password = PasswordField("Password", validators=[DataRequired()])
    submit = SubmitField("Login")
```

### Flask-Login

```python
from flask_login import LoginManager, login_user, logout_user, login_required, current_user

login_manager = LoginManager()
login_manager.init_app(app)

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

@app.route("/login", methods=["POST"])
def login():
    user = User.query.filter_by(email=request.form["email"]).first()
    if user and user.check_password(request.form["password"]):
        login_user(user)
        return redirect("/dashboard")
    return "Invalid credentials", 401

@app.route("/dashboard")
@login_required
def dashboard():
    return f"Welcome, {current_user.username}"
```

## Error Handling

```python
@app.errorhandler(404)
def not_found(error):
    return render_template("404.html"), 404

@app.errorhandler(500)
def internal_error(error):
    db.session.rollback()
    return render_template("500.html"), 500

@app.errorhandler(ValueError)
def handle_value_error(error):
    return jsonify({"error": str(error)}), 400
```

## g and Application Context

```python
from flask import g, current_app, has_app_context

@app.before_request
def before_request():
    g.db = get_db_connection()
    g.start_time = time.time()

@app.teardown_request
def teardown_request(exception):
    db = g.pop("db", None)
    if db is not None:
        db.close()

# Application context
with app.app_context():
    print(current_app.config["SECRET_KEY"])
```

## Configuration

```python
# config.py
class Config:
    SECRET_KEY = "dev-secret"
    SQLALCHEMY_DATABASE_URI = "sqlite:///app.db"

class ProductionConfig(Config):
    SQLALCHEMY_DATABASE_URI = "postgresql://user:pass@host/db"
    DEBUG = False

class TestingConfig(Config):
    TESTING = True
    SQLALCHEMY_DATABASE_URI = "sqlite:///:memory:"

# Load config
app.config.from_object(ProductionConfig)
# or
app.config.from_envvar("FLASK_CONFIG")
# or from file
app.config.from_pyfile("config.py")
```

## Testing

```python
import pytest

@pytest.fixture
def client():
    app = create_app("testing")
    with app.test_client() as client:
        with app.app_context():
            db.create_all()
        yield client

def test_home(client):
    response = client.get("/")
    assert response.status_code == 200

def test_create_item(client):
    response = client.post("/api/items", json={"name": "test"})
    assert response.status_code == 201
    assert response.json["name"] == "test"

def test_login(client):
    response = client.post("/auth/login", data={
        "email": "user@example.com",
        "password": "secret"
    }, follow_redirects=True)
    assert b"Welcome" in response.data
```

## See Also

- [Flask Documentation](https://flask.palletsprojects.com/en/latest/)
- [Jinja2 Documentation](https://jinja.palletsprojects.com/)
- [Flask-SQLAlchemy](https://flask-sqlalchemy.palletsprojects.com/)
- [Flask GitHub](https://github.com/pallets/flask)
