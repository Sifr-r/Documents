# Django

Django 5+ is a high-level Python web framework that encourages rapid development and clean, pragmatic design. It follows the MTV (Model-Template-View) pattern and ships with an ORM, admin panel, authentication, and migrations out of the box.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Models, views, templates, forms, ORM, admin, URL routing, middleware, signals, and auth |

## Quick Reference

### Project Setup

```bash
django-admin startproject myproject
cd myproject
python manage.py startapp blog
python manage.py migrate
python manage.py runserver
```

### Model

```python
from django.db import models

class Article(models.Model):
    title = models.CharField(max_length=200)
    body = models.TextField()
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ["-created"]

    def __str__(self):
        return self.title
```

### View

```python
from django.shortcuts import render, get_object_or_404
from .models import Article

def article_list(request):
    articles = Article.objects.all()
    return render(request, "blog/list.html", {"articles": articles})

def article_detail(request, pk):
    article = get_object_or_404(Article, pk=pk)
    return render(request, "blog/detail.html", {"article": article})
```

### URL Routing

```python
from django.urls import path
from . import views

urlpatterns = [
    path("", views.article_list, name="article-list"),
    path("<int:pk>/", views.article_detail, name="article-detail"),
]
```

### Template

```html
{% extends "base.html" %}
{% block content %}
  {% for article in articles %}
    <h2>{{ article.title }}</h2>
    <p>{{ article.body|truncatewords:30 }}</p>
  {% empty %}
    <p>No articles yet.</p>
  {% endfor %}
{% endblock %}
```

### Form

```python
from django import forms
from .models import Article

class ArticleForm(forms.ModelForm):
    class Meta:
        model = Article
        fields = ["title", "body"]
```

### Admin

```python
from django.contrib import admin
from .models import Article

@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ["title", "created"]
    search_fields = ["title"]
```

### ORM Queries

```python
Article.objects.filter(created__year=2025)
Article.objects.exclude(title__icontains="draft")
Article.objects.annotate(word_count=Length("body"))
Article.objects.aggregate(avg_len=Avg("body"))
```

### Middleware

```python
class TimingMiddleware:
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        response = self.get_response(request)
        return response
```

### Management Command

```bash
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
python manage.py shell
python manage.py collectstatic
```

## See Also

- [Django Documentation](https://docs.djangoproject.com/en/stable/)
- [Django GitHub](https://github.com/django/django)
- [Django REST Framework](https://www.django-rest-framework.org/)
