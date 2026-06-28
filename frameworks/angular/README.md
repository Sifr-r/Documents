# Angular

Angular is a TypeScript-based framework for building scalable web applications with a comprehensive set of tools and features. Angular 17+ introduces signals, standalone components, and new control flow syntax.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Components, templates, signals, dependency injection, routing, and RxJS |

## Quick Reference

### Standalone Component

```ts
import { Component } from '@angular/core';

@Component({
  selector: 'app-greeting',
  standalone: true,
  template: `<h1>Hello, {{ name }}</h1>`
})
export class GreetingComponent {
  name = 'Angular';
}
```

### Signals

```ts
import { Component, signal, computed, effect } from '@angular/core';

@Component({
  selector: 'app-counter',
  standalone: true,
  template: `
    <p>Count: {{ count() }}</p>
    <p>Doubled: {{ doubled() }}</p>
    <button (click)="increment()">Increment</button>
  `
})
export class CounterComponent {
  count = signal(0);
  doubled = computed(() => this.count() * 2);

  constructor() {
    effect(() => console.log('Count:', this.count()));
  }

  increment() {
    this.count.update(n => n + 1);
  }
}
```

### Dependency Injection

```ts
import { inject, Injectable } from '@angular/core';
import { CommonModule } from '@angular/common';

@Injectable({ providedIn: 'root' })
export class DataService {
  getData() { return ['item1', 'item2']; }
}

@Component({
  selector: 'app-list',
  standalone: true,
  imports: [CommonModule],
  template: `<li *ngFor="let item of items">{{ item }}</li>`
})
export class ListComponent {
  private dataService = inject(DataService);
  items = this.dataService.getData();
}
```

### HttpClient

```ts
import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({ providedIn: 'root' })
export class ApiService {
  private http = inject(HttpClient);

  getUsers() {
    return this.http.get<User[]>('/api/users');
  }
}
```

### New Control Flow (Angular 17+)

```ts
@Component({
  template: `
    @if (show) {
      <p>Visible</p>
    } @else {
      <p>Hidden</p>
    }

    @for (item of items; track item.id) {
      <li>{{ item.name }}</li>
    }
  `
})
```

### RxJS Observables

```ts
import { Observable } from 'rxjs';
import { AsyncPipe } from '@angular/common';

@Component({
  imports: [AsyncPipe],
  template: `<p>{{ data$ | async }}</p>`
})
export class DataComponent {
  data$: Observable<string>;
}
```
