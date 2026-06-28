# Phoenix

Phoenix 1.7+ is a web framework for Elixir built on the BEAM VM. It provides high-concurrency, fault-tolerant web applications with LiveView for real-time interactive UIs without JavaScript.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Router, controllers, views/templates, LiveView, channels, schemas/Ecto, plugs, authentication, and testing |

## Quick Reference

### Project Setup

```bash
mix phx.new my_app
cd my_app
mix ecto.create
mix phx.server
```

### Controller

```elixir
defmodule MyAppWeb.UserController do
  use MyAppWeb, :controller

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, :index, users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, :show, user: user)
  end
end
```

### LiveView

```elixir
defmodule MyAppWeb.CounterLive do
  use Phoenix.LiveView

  def mount(_params, _session, socket) do
    {:ok, assign(socket, count: 0)}
  end

  def handle_event("increment", _, socket) do
    {:noreply, update(socket, :count, &(&1 + 1))}
  end

  def render(assigns) do
    ~H"""
    <h1>Count: <%= @count %></h1>
    <button phx-click="increment">+</button>
    """
  end
end
```

### Schema

```elixir
schema "users" do
  field :name, :string
  field :email, :string
  has_many :posts, MyApp.Blog.Post
  timestamps()
end
```

## See Also

- [Phoenix Documentation](https://hexdocs.pm/phoenix/)
- [Phoenix GitHub](https://github.com/phoenixframework/phoenix)
- [Phoenix LiveView](https://hexdocs.pm/phoenix_live_view/)
