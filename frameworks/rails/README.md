# Ruby on Rails

Ruby on Rails 7+ is a full-stack web framework for Ruby that emphasizes convention over configuration and the MVC pattern. It includes ActiveRecord ORM, automated migrations, Hotwire for real-time UI, and comprehensive testing support.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Models, controllers, views, routing, migrations, ActiveJob, ActionMailer, assets, Hotwire, and testing |

## Quick Reference

### Project Setup

```bash
rails new myapp --database=postgresql
cd myapp
rails generate scaffold Article title:string body:text
rails db:migrate
rails server
```

### Model

```ruby
class Article < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true

  scope :published, -> { where(published: true) }
  scope :recent, -> { order(created_at: :desc).limit(10) }
end
```

### Controller

```ruby
class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.published.recent
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
```

### View (ERB)

```erb
<% @articles.each do |article| %>
  <h2><%= link_to article.title, article %></h2>
  <p><%= truncate(article.body, length: 200) %></p>
<% end %>
```

### Routing

```ruby
Rails.application.routes.draw do
  resources :articles
  namespace :admin do
    resources :users
  end
  root "articles#index"
end
```

### Migration

```ruby
class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.boolean :published, default: false
      t.timestamps
    end
  end
end
```

### Hotwire (Turbo)

```erb
<%= turbo_frame_tag "article_#{@article.id}" do %>
  <h1><%= @article.title %></h1>
  <%= @article.body %>
<% end %>
```

### CLI

```bash
rails console
rails db:migrate
rails db:seed
rails generate model Post title:string
rails routes
```

## See Also

- [Ruby on Rails Guides](https://guides.rubyonrails.org/)
- [Rails API Documentation](https://api.rubyonrails.org/)
- [Rails GitHub](https://github.com/rails/rails)
- [Hotwire Documentation](https://hotwired.dev/)
