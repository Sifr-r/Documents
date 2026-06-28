# Django — Core

## Models

### Fields

```python
from django.db import models

class Article(models.Model):
    title = models.CharField(max_length=200)
    slug = models.SlugField(unique=True)
    body = models.TextField()
    views = models.PositiveIntegerField(default=0)
    is_published = models.BooleanField(default=False)
    rating = models.DecimalField(max_digits=3, decimal_places=1, null=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    author = models.ForeignKey("auth.User", on_delete=models.CASCADE)
    tags = models.ManyToManyField("Tag", blank=True)
    image = models.ImageField(upload_to="articles/", blank=True)
```

Common field types: `CharField`, `TextField`, `IntegerField`, `FloatField`, `BooleanField`, `DateField`, `DateTimeField`, `EmailField`, `URLField`, `FileField`, `ImageField`, `UUIDField`, `JSONField`.

### Meta Options

```python
class Article(models.Model):
    title = models.CharField(max_length=200)

    class Meta:
        ordering = ["-created"]
        verbose_name_plural = "articles"
        indexes = [models.Index(fields=["title", "created"])]
        constraints = [
            models.UniqueConstraint(fields=["slug"], name="unique_slug")
        ]
```

### Migrations

```bash
python manage.py makemigrations          # Generate migration files
python manage.py migrate                 # Apply migrations
python manage.py makemigrations --merge  # Merge conflicting migrations
python manage.py migrate --fake          # Mark migration as applied
python manage.py showmigrations          # Show migration status
```

### Relationships

```python
class Author(models.Model):
    name = models.CharField(max_length=100)

class Book(models.Model):
    author = models.ForeignKey(Author, on_delete=models.CASCADE, related_name="books")

class Profile(models.Model):
    user = models.OneToOneField("auth.User", on_delete=models.CASCADE)

class Article(models.Model):
    tags = models.ManyToManyField("Tag", related_name="articles")
```

## Views

### Function-Based Views

```python
from django.shortcuts import render, redirect, get_object_or_404
from django.http import JsonResponse
from .models import Article
from .forms import ArticleForm

def article_list(request):
    articles = Article.objects.filter(is_published=True)
    return render(request, "blog/list.html", {"articles": articles})

def article_create(request):
    if request.method == "POST":
        form = ArticleForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect("article-list")
    else:
        form = ArticleForm()
    return render(request, "blog/create.html", {"form": form})
```

### Class-Based Views

```python
from django.views import View
from django.views.generic import ListView, DetailView, CreateView, UpdateView, DeleteView
from django.urls import reverse_lazy
from .models import Article

class ArticleListView(ListView):
    model = Article
    template_name = "blog/list.html"
    context_object_name = "articles"
    paginate_by = 10

class ArticleDetailView(DetailView):
    model = Article
    template_name = "blog/detail.html"

class ArticleCreateView(CreateView):
    model = Article
    fields = ["title", "body"]
    template_name = "blog/create.html"
    success_url = reverse_lazy("article-list")

class ArticleDeleteView(DeleteView):
    model = Article
    success_url = reverse_lazy("article-list")
```

### Decorators

```python
from django.contrib.auth.decorators import login_required, permission_required
from django.views.decorators.http import require_GET, require_POST
from django.views.decorators.cache import cache_page

@login_required
@permission_required("blog.view_article")
@cache_page(60 * 15)
def my_view(request):
    ...
```

## Templates

### Inheritance

```html
{# base.html #}
<!DOCTYPE html>
<html>
<head><title>{% block title %}My Site{% endblock %}</title></head>
<body>
  {% block content %}{% endblock %}
</body>
</html>

{# child.html #}
{% extends "base.html" %}
{% block title %}Articles{% endblock %}
{% block content %}
  <h1>Articles</h1>
{% endblock %}
```

### Tags and Filters

```html
{% if user.is_authenticated %}
  <p>Hello, {{ user.username }}</p>
{% endif %}

{% for item in items %}
  <li>{{ item.name|upper }} — ${{ item.price|floatformat:2 }}</li>
{% empty %}
  <li>No items.</li>
{% endfor %}

{% url 'article-detail' pk=article.id %}
{% static 'css/style.css' %}
{% csrf_token %}
{{ value|default:"nothing" }}
{{ text|truncatewords:20 }}
{{ date|date:"Y-m-d" }}
```

### Includes

```html
{% include "partials/nav.html" %}
{% include "partials/card.html" with item=article %}
```

## Forms

```python
from django import forms
from .models import Article

class ArticleForm(forms.ModelForm):
    class Meta:
        model = Article
        fields = ["title", "body", "tags"]
        widgets = {
            "title": forms.TextInput(attrs={"class": "form-control"}),
            "body": forms.Textarea(attrs={"rows": 10}),
        }

    def clean_title(self):
        title = self.cleaned_data["title"]
        if len(title) < 5:
            raise forms.ValidationError("Title too short.")
        return title
```

Using forms in views:

```python
def create(request):
    if request.method == "POST":
        form = ArticleForm(request.POST, request.FILES)
        if form.is_valid():
            article = form.save(commit=False)
            article.author = request.user
            article.save()
            return redirect("article-list")
    else:
        form = ArticleForm()
    return render(request, "blog/create.html", {"form": form})
```

## URL Routing

```python
from django.urls import path, include
from . import views

app_name = "blog"

urlpatterns = [
    path("", views.ArticleListView.as_view(), name="list"),
    path("<int:pk>/", views.ArticleDetailView.as_view(), name="detail"),
    path("<slug:slug>/", views.by_slug, name="by-slug"),
    path("<uuid:id>/", views.by_uuid, name="by-uuid"),
]

# Root urls.py
urlpatterns = [
    path("blog/", include("blog.urls")),
    path("api/", include("api.urls")),
]
```

Path converters: `int`, `str`, `slug`, `uuid`, `path`.

## ORM

```python
from django.db.models import Count, Avg, Q, F

# Filtering
Article.objects.filter(title__icontains="django")
Article.objects.filter(created__gte="2025-01-01")
Article.objects.filter(author__username="admin")
Article.objects.filter(Q(title__icontains="a") | Q(title__icontains="b"))

# Select related (JOIN) and prefetch related
Article.objects.select_related("author")
Author.objects.prefetch_related("books")

# Annotation and aggregation
Article.objects.annotate(word_count=Count("body"))
Article.objects.values("author__name").annotate(total=Count("id"))
Article.objects.aggregate(avg_views=Avg("views"))

# Bulk operations
Article.objects.filter(is_published=False).update(is_published=True)
Article.objects.bulk_create([Article(title=f"Post {i}") for i in range(10)])

# F expressions
Article.objects.update(views=F("views") + 1)
```

## Admin

```python
from django.contrib import admin
from .models import Article, Comment

class CommentInline(admin.TabularInline):
    model = Comment
    extra = 1

@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ["title", "author", "is_published", "created"]
    list_filter = ["is_published", "created"]
    search_fields = ["title", "body"]
    prepopulated_fields = {"slug": ("title",)}
    inlines = [CommentInline]
    actions = ["publish_articles"]

    @admin.action(description="Mark selected as published")
    def publish_articles(self, request, queryset):
        queryset.update(is_published=True)
```

## Middleware

```python
class RequestLogMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        # Before view
        print(f"Request: {request.method} {request.path}")
        response = self.get_response(request)
        # After view
        print(f"Response: {response.status_code}")
        return response
```

Add to `settings.py`: `MIDDLEWARE = [..., "myapp.middleware.RequestLogMiddleware"]`

## Signals

```python
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User

@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
```

## Authentication and Permissions

```python
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.models import User

@login_required
def dashboard(request):
    return render(request, "dashboard.html")

class ProfileView(LoginRequiredMixin, DetailView):
    model = User

# Creating users
from django.contrib.auth import get_user_model
User = get_user_model()
user = User.objects.create_user(username="john", email="john@example.com", password="secret")

# Permissions
user.has_perm("blog.add_article")
user.user_permissions.add(permission)
```

## See Also

- [Django Documentation](https://docs.djangoproject.com/en/stable/)
- [Django Models Reference](https://docs.djangoproject.com/en/stable/ref/models/)
- [Django Views Reference](https://docs.djangoproject.com/en/stable/ref/class-based-views/)
- [Django REST Framework](https://www.django-rest-framework.org/)
