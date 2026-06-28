# Ruby on Rails — Core

## Models (ActiveRecord)

### Associations

```ruby
class User < ApplicationRecord
  has_many :articles, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :comments, through: :articles
  has_and_belongs_to_many :roles
end

class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :taggings, as: :taggable
  accepts_nested_attributes_for :comments, allow_destroy: true
end
```

### Validations

```ruby
class Article < ApplicationRecord
  validates :title, presence: true, uniqueness: true, length: { in: 5..200 }
  validates :body, presence: true
  validates :slug, format: { with: /\A[a-z0-9-]+\z/ }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :email, inclusion: { in: %w[admin@example.com] }, if: :admin?

  validate :custom_validation

  private

  def custom_validation
    errors.add(:title, "cannot contain profanity") if title&.match?(/badword/)
  end
end
```

### Callbacks

```ruby
class Article < ApplicationRecord
  before_validation :normalize_title
  before_save :generate_slug
  after_create :notify_subscribers
  around_save :cache_invalidation

  private

  def normalize_title
    self.title = title&.strip&.titleize
  end

  def generate_slug
    self.slug = title.parameterize
  end

  def notify_subscribers
    ArticleNotificationJob.perform_later(id)
  end
end
```

### Scopes and Queries

```ruby
class Article < ApplicationRecord
  scope :published, -> { where(published: true) }
  scope :recent, -> { order(created_at: :desc) }
  scope :by_author, ->(user) { where(user: user) }

  def self.search(query)
    where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%")
  end
end

# Usage
Article.published.recent.limit(10)
Article.search("rails").by_author(current_user)
Article.where(published: true).includes(:user, :comments)
Article.joins(:comments).group("articles.id").having("count(comments.id) > 5")
Article.find_by!(slug: "hello-world")
Article.find_or_create_by(title: "New Post")
```

## Controllers

```ruby
class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  after_action :log_action, only: [:create, :update]

  def index
    @articles = Article.published.page(params[:page]).per(20)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: "Article created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "Deleted."
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :published, tags: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
```

### API Controller

```ruby
class Api::V1::ArticlesController < ActionController::API
  def index
    articles = Article.published
    render json: articles, status: :ok
  end

  def create
    article = Article.new(article_params)
    if article.save
      render json: article, status: :created
    else
      render json: { errors: article.errors }, status: :unprocessable_entity
    end
  end
end
```

## Views (ERB)

```erb
<%# app/views/articles/index.html.erb %>
<h1>Articles</h1>

<%= render "search_form" %>

<% @articles.each do |article| %>
  <%= render "article_card", article: article %>
<% end %>

<%= paginate @articles %>

<%# app/views/articles/_article_card.html.erb %>
<div class="card">
  <h2><%= link_to article.title, article_path(article) %></h2>
  <p><%= truncate(article.body, length: 150) %></p>
  <time><%= article.created_at.strftime("%B %d, %Y") %></time>
</div>

<%# app/views/articles/_form.html.erb %>
<%= form_with(model: article) do |f| %>
  <% if article.errors.any? %>
    <div id="errors">
      <% article.errors.full_messages.each do |msg| %>
        <p><%= msg %></p>
      <% end %>
    </div>
  <% end %>

  <%= f.label :title %>
  <%= f.text_field :title %>

  <%= f.label :body %>
  <%= f.rich_text_area :body %>

  <%= f.submit %>
<% end %>
```

### Helpers

```ruby
module ArticlesHelper
  def article_status(article)
    article.published? ? "Published" : "Draft"
  end
end
```

## Routing

```ruby
Rails.application.routes.draw do
  # RESTful resources
  resources :articles do
    resources :comments, only: [:create, :destroy]
    member do
      patch :publish
    end
    collection do
      get :search
    end
  end

  # Namespaced routes
  namespace :admin do
    resources :users
    resources :settings, only: [:index, :update]
  end

  # Concerns
  concern :commentable do
    resources :comments, only: [:index, :create]
  end
  resources :articles, concerns: :commentable
  resources :posts, concerns: :commentable

  # Custom routes
  get "/about", to: "pages#about", as: :about
  root "articles#index"
end
```

## Migrations

```ruby
class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :body
      t.string :slug, null: false, index: { unique: true }
      t.boolean :published, default: false
      t.references :user, null: false, foreign_key: true
      t.jsonb :metadata, default: {}
      t.timestamps
    end

    add_index :articles, [:user_id, :published]
  end
end

class AddCategoryToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :category, :string, default: "general"
    remove_column :articles, :old_field, :string
    rename_column :articles, :name, :title
    change_column :articles, :body, :text, null: false
  end
end
```

Commands:

```bash
rails db:migrate
rails db:rollback
rails db:migrate:redo
rails db:schema:load
rails db:seed
```

## ActiveJob and ActionMailer

```ruby
class NotificationJob < ApplicationJob
  queue_as :default
  retry_on StandardError, wait: :polynomially_longer, attempts: 3

  def perform(article_id)
    article = Article.find(article_id)
    NotificationMailer.new_article(article).deliver_later
  end
end

class NotificationMailer < ApplicationMailer
  default from: "noreply@example.com"

  def new_article(article)
    @article = article
    mail(to: @article.user.email, subject: "New article published")
  end
end
```

## Asset Pipeline

```ruby
# importmap-rails (Rails 7+ default)
# config/importmap.rb
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin_all_from "app/javascript/controllers", under: "controllers"
```

```erb
<%# In layout %>
<%= javascript_importmap_tags %>
<%= stylesheet_link_tag "application" %>
```

## Hotwire (Turbo + Stimulus)

### Turbo Frames

```erb
<%= turbo_frame_tag "article_#{@article.id}" do %>
  <h1><%= @article.title %></h1>
  <p><%= @article.body %></p>
  <%= link_to "Edit", edit_article_path(@article) %>
<% end %>
```

### Turbo Streams

```ruby
# In controller
def create
  @article = Article.create!(article_params)
  respond_to do |format|
    format.html { redirect_to @article }
    format.turbo_stream
  end
end
```

```erb
<%# create.turbo_stream.erb %>
<%= turbo_stream.append "articles" do %>
  <%= render @article %>
<% end %>
<%= turbo_stream.replace "new_article" do %>
  <%= render "form", article: Article.new %>
<% end %>
```

### Stimulus Controllers

```javascript
// app/javascript/controllers/counter_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["count"]
  static values = { value: Number }

  increment() {
    this.valueValue++
    this.countTarget.textContent = this.valueValue
  }
}
```

```erb
<div data-controller="counter" data-counter-value-value="0">
  <span data-counter-target="count">0</span>
  <button data-action="click->counter#increment">+</button>
</div>
```

## Testing

### Minitest

```ruby
# test/models/article_test.rb
class ArticleTest < ActiveSupport::TestCase
  test "valid article" do
    article = Article.new(title: "Hello", body: "World")
    assert article.valid?
  end

  test "invalid without title" do
    article = Article.new(body: "World")
    assert_not article.valid?
    assert_includes article.errors[:title], "can't be blank"
  end
end

# test/controllers/articles_controller_test.rb
class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get articles_url
    assert_response :success
  end

  test "should create article" do
    assert_difference("Article.count") do
      post articles_url, params: { article: { title: "New", body: "Content" } }
    end
    assert_redirected_to article_url(Article.last)
  end
end
```

### RSpec

```ruby
RSpec.describe Article, type: :model do
  it "is valid with title and body" do
    article = build(:article)
    expect(article).to be_valid
  end

  it "is invalid without a title" do
    article = build(:article, title: nil)
    expect(article).not_to be_valid
  end
end
```

## See Also

- [Ruby on Rails Guides](https://guides.rubyonrails.org/)
- [ActiveRecord Query Interface](https://guides.rubyonrails.org/active_record_querying.html)
- [Rails Routing Guide](https://guides.rubyonrails.org/routing.html)
- [Hotwire Documentation](https://hotwired.dev/)
- [Rails GitHub](https://github.com/rails/rails)
