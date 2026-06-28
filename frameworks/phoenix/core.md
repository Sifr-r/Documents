# Phoenix — Core

## Router

```elixir
defmodule MyAppWeb.Router do
  use MyAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyAppWeb do
    pipe_through :browser
    get "/", PageController, :index
    resources "/users", UserController
  end

  scope "/api", MyAppWeb do
    pipe_through :api
    resources "/users", UserController, except: [:new, :edit]
  end
end
```

## Controllers

```elixir
defmodule MyAppWeb.UserController do
  use MyAppWeb, :controller

  alias MyApp.Accounts

  plug :authenticate when action in [:edit, :update, :delete]

  def index(conn, params) do
    users = Accounts.list_users(params)
    render(conn, :index, users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, :show, user: user)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created.")
        |> redirect(to: ~p"/users/#{user}")
      {:error, changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  defp authenticate(conn, _opts) do
    if conn.assigns[:current_user] do
      conn
    else
      conn |> redirect(to: ~p"/login") |> halt()
    end
  end
end
```

## Views and Templates

### HEEx Templates

```heex
<.header>Users</.header>

<.table id="users" rows={@users}>
  <:col :let={user} label="Name"><%= user.name %></:col>
  <:col :let={user} label="Email"><%= user.email %></:col>
</.table>

<.link navigate={~p"/users/new"}>New User</.link>
```

### Function Components

```elixir
defmodule MyAppWeb.CoreComponents do
  use Phoenix.Component

  attr :name, :string, required: true
  attr :class, :string, default: ""

  def badge(assigns) do
    ~H"""
    <span class={"badge #{@class}"}><%= @name %></span>
    """
  end
end

# Usage
<.badge name="Admin" class="bg-blue-500" />
```

## LiveView

```elixir
defmodule MyAppWeb.TodoLive do
  use MyAppWeb, :live_view

  def mount(_params, _session, socket) do
    todos = Todos.list()
    {:ok, assign(socket, todos: todos, new_todo: "")}
  end

  def handle_event("add", _, socket) do
    todo = Todos.create(socket.assigns.new_todo)
    {:noreply, update(socket, :todos, &(&1 ++ [todo]))}
  end

  def handle_event("toggle", %{"id" => id}, socket) do
    Todos.toggle(String.to_integer(id))
    {:noreply, assign(socket, :todos, Todos.list())}
  end

  def render(assigns) do
    ~H"""
    <form phx-submit="add">
      <input type="text" name="todo" value={@new_todo} />
      <button type="submit">Add</button>
    </form>

    <ul>
      <li :for={todo <- @todos} phx-click="toggle" phx-value-id={todo.id}>
        <%= if todo.done, do: "✓", else: "○" %> <%= todo.text %>
      </li>
    </ul>
    """
  end
end
```

### LiveView Lifecycle

- `mount/3` — called once on initial render
- `handle_params/3` — called on mount and URL changes
- `handle_event/3` — handles client events (`phx-click`, `phx-submit`)
- `handle_info/2` — handles process messages

## Channels

```elixir
defmodule MyAppWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:" <> room_id, _payload, socket) do
    {:ok, assign(socket, :room_id, room_id)}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast!(socket, "new_msg", %{body: body, user: socket.assigns.user})
    {:noreply, socket}
  end
end

# Channel routes
channel "room:*", MyAppWeb.RoomChannel
```

### Client Side

```javascript
let socket = new Socket("/socket", { params: { token: userToken } });
let channel = socket.channel("room:lobby", {});

channel.on("new_msg", (msg) => {
  console.log(`${msg.user}: ${msg.body}`);
});

channel.push("new_msg", { body: "Hello!" });
socket.connect();
```

## Schemas and Ecto

```elixir
defmodule MyApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    has_many :posts, MyApp.Blog.Post
    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case get_change(changeset, :password) do
      nil -> changeset
      pw -> put_change(changeset, :password_hash, Bcrypt.hash_pwd_salt(pw))
    end
  end
end
```

### Ecto Queries

```elixir
import Ecto.Query

# Simple query
from(u in User, where: u.email == ^email, select: u)

# Pipe syntax
User
|> where([u], u.name == "Alice")
|> order_by([u], desc: u.inserted_at)
|> limit(10)
|> Repo.all()

# Associations
user = Repo.get(User, 1) |> Repo.preload(:posts)
```

## Plugs

```elixir
# Function plug
def authenticate(conn, _opts) do
  case get_session(conn, :user_id) do
    nil -> conn |> redirect(to: "/login") |> halt()
    id -> assign(conn, :current_user, Accounts.get_user!(id))
  end
end

# Module plug
defmodule MyAppWeb.Plugs.RequireAuth do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    if conn.assigns[:current_user] do
      conn
    else
      conn |> send_resp(401, "Unauthorized") |> halt()
    end
  end
end
```

## Authentication

```elixir
# Phoenix.Token for API tokens
token = Phoenix.Token.sign(MyAppWeb.Endpoint, "user auth", user.id)
{:ok, user_id} = Phoenix.Token.verify(MyAppWeb.Endpoint, "user auth", token, max_age: 86400)

# Session-based
conn
|> put_session(:user_id, user.id)
|> redirect(to: "/dashboard")
```

## Testing

```elixir
# ConnCase (controller tests)
defmodule MyAppWeb.UserControllerTest do
  use MyAppWeb.ConnCase

  test "GET /users", %{conn: conn} do
    conn = get(conn, ~p"/users")
    assert html_response(conn, 200) =~ "Users"
  end

  test "POST /users", %{conn: conn} do
    conn = post(conn, ~p"/users", user: %{name: "Alice", email: "a@b.com"})
    assert redirected_to(conn) =~ "/users/"
  end
end

# LiveView test
defmodule MyAppWeb.CounterLiveTest do
  use MyAppWeb.ConnCase
  import Phoenix.LiveViewTest

  test "increments counter", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/counter")
    assert render_click(view, "increment") =~ "Count: 1"
  end
end

# Channel test
defmodule MyAppWeb.RoomChannelTest do
  use MyAppWeb.ChannelCase

  test "joins room" do
    {:ok, _, socket} = subscribe_and_join(socket, RoomChannel, "room:lobby")
    assert socket.joined
  end
end
```

## See Also

- [Phoenix Documentation](https://hexdocs.pm/phoenix/)
- [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/)
- [Ecto Documentation](https://hexdocs.pm/ecto/)
- [Phoenix GitHub](https://github.com/phoenixframework/phoenix)
