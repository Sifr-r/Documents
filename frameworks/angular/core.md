# Angular — Core

## Component Decorator

```ts
import { Component } from '@angular/core';

@Component({
  selector: 'app-user-card',
  templateUrl: './user-card.component.html',
  styleUrls: ['./user-card.component.css']
})
export class UserCardComponent {
  name = 'John Doe';
  age = 30;
}
```

## Standalone Components

```ts
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-standalone',
  standalone: true,
  imports: [CommonModule],
  template: `<p>Standalone component</p>`
})
export class StandaloneComponent {}
```

## Templates: Interpolation

```ts
@Component({
  template: `
    <h1>{{ title }}</h1>
    <p>User: {{ user.name }} ({{ user.age }})</p>
    <p>Method result: {{ calculateTotal() }}</p>
  `
})
export class AppComponent {
  title = 'My App';
  user = { name: 'John', age: 30 };
  
  calculateTotal() {
    return 100;
  }
}
```

## Templates: Property Binding

```ts
@Component({
  template: `
    <img [src]="imageUrl" />
    <button [disabled]="isDisabled">Click</button>
    <div [class.active]="isActive">Content</div>
    <div [style.color]="textColor">Text</div>
  `
})
export class AppComponent {
  imageUrl = '/logo.png';
  isDisabled = false;
  isActive = true;
  textColor = 'blue';
}
```

## Templates: Event Binding

```ts
@Component({
  template: `
    <button (click)="onClick()">Click me</button>
    <input (input)="onInput($event)" />
    <form (ngSubmit)="onSubmit()">
      <button type="submit">Submit</button>
    </form>
  `
})
export class AppComponent {
  onClick() {
    console.log('Clicked');
  }
  
  onInput(event: Event) {
    const value = (event.target as HTMLInputElement).value;
    console.log(value);
  }
  
  onSubmit() {
    console.log('Form submitted');
  }
}
```

## Structural Directives: *ngIf and *ngFor

```ts
@Component({
  template: `
    <div *ngIf="show">Visible</div>
    <div *ngIf="user; else noUser">
      {{ user.name }}
    </div>
    <ng-template #noUser>
      <p>No user</p>
    </ng-template>
    
    <ul>
      <li *ngFor="let item of items; let i = index">
        {{ i }}: {{ item }}
      </li>
    </ul>
  `
})
export class AppComponent {
  show = true;
  user = { name: 'John' };
  items = ['Apple', 'Banana', 'Orange'];
}
```

## New Control Flow (Angular 17+)

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
    } @empty {
      <p>No items</p>
    }
    
    @switch (status) {
      @case ('active') {
        <p>Active</p>
      }
      @case ('inactive') {
        <p>Inactive</p>
      }
      @default {
        <p>Unknown</p>
      }
    }
  `
})
export class AppComponent {
  show = true;
  items = [{ id: 1, name: 'Item 1' }];
  status = 'active';
}
```

## Signals

```ts
import { Component, signal, computed, effect } from '@angular/core';

@Component({
  selector: 'app-signals',
  standalone: true,
  template: `
    <p>Count: {{ count() }}</p>
    <p>Doubled: {{ doubled() }}</p>
    <button (click)="increment()">+</button>
    <button (click)="reset()">Reset</button>
  `
})
export class SignalsComponent {
  // Writable signal
  count = signal(0);
  
  // Computed signal
  doubled = computed(() => this.count() * 2);
  
  constructor() {
    // Effect - runs when signals change
    effect(() => {
      console.log('Count changed:', this.count());
    });
  }
  
  increment() {
    this.count.update(n => n + 1);
  }
  
  reset() {
    this.count.set(0);
  }
}
```

## Dependency Injection

```ts
import { Injectable, inject } from '@angular/core';

// Service definition
@Injectable({
  providedIn: 'root'
})
export class LoggerService {
  log(message: string) {
    console.log(message);
  }
}

// Using inject() function
@Component({
  selector: 'app-example',
  standalone: true,
  template: `<button (click)="doLog()">Log</button>`
})
export class ExampleComponent {
  private logger = inject(LoggerService);
  
  doLog() {
    this.logger.log('Button clicked');
  }
}

// Constructor injection
@Component({
  selector: 'app-example2',
  template: `<p>Example</p>`
})
export class Example2Component {
  constructor(private logger: LoggerService) {}
}
```

## Services and HttpClient

```ts
import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface User {
  id: number;
  name: string;
  email: string;
}

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private http = inject(HttpClient);
  private apiUrl = 'https://api.example.com/users';
  
  getUsers(): Observable<User[]> {
    return this.http.get<User[]>(this.apiUrl);
  }
  
  getUser(id: number): Observable<User> {
    return this.http.get<User>(`${this.apiUrl}/${id}`);
  }
  
  createUser(user: Omit<User, 'id'>): Observable<User> {
    return this.http.post<User>(this.apiUrl, user);
  }
  
  updateUser(id: number, user: Partial<User>): Observable<User> {
    return this.http.put<User>(`${this.apiUrl}/${id}`, user);
  }
  
  deleteUser(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/${id}`);
  }
}
```

## Routing

```ts
import { Routes } from '@angular/router';
import { HomeComponent } from './home/home.component';
import { UserComponent } from './user/user.component';

export const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'user/:id', component: UserComponent },
  { 
    path: 'admin', 
    loadChildren: () => import('./admin/admin.routes')
      .then(m => m.routes) 
  },
  { path: '**', redirectTo: '' }
];

// In component
import { Router, ActivatedRoute } from '@angular/router';

@Component({
  template: `
    <a routerLink="/">Home</a>
    <a [routerLink]="['/user', userId]">User</a>
    <router-outlet></router-outlet>
  `
})
export class AppComponent {
  private router = inject(Router);
  private route = inject(ActivatedRoute);
  
  userId = this.route.snapshot.paramMap.get('id');
  
  navigate() {
    this.router.navigate(['/user', 123]);
  }
}
```

## Forms: Reactive Forms

```ts
import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';

@Component({
  selector: 'app-form',
  standalone: true,
  imports: [ReactiveFormsModule, CommonModule],
  template: `
    <form [formGroup]="form" (ngSubmit)="onSubmit()">
      <input formControlName="name" placeholder="Name" />
      <input formControlName="email" type="email" placeholder="Email" />
      
      <div *ngIf="form.get('email')?.invalid && form.get('email')?.touched">
        Invalid email
      </div>
      
      <button type="submit" [disabled]="form.invalid">Submit</button>
    </form>
  `
})
export class FormComponent {
  private fb = inject(FormBuilder);
  
  form = this.fb.group({
    name: ['', [Validators.required, Validators.minLength(3)]],
    email: ['', [Validators.required, Validators.email]]
  });
  
  onSubmit() {
    if (this.form.valid) {
      console.log(this.form.value);
    }
  }
}
```

## Forms: Template-Driven

```ts
import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-template-form',
  standalone: true,
  imports: [FormsModule],
  template: `
    <form #form="ngForm" (ngSubmit)="onSubmit(form.value)">
      <input 
        name="name" 
        ngModel 
        required 
        minlength="3"
        #nameField="ngModel"
      />
      <div *ngIf="nameField.invalid && nameField.touched">
        Name is required (min 3 chars)
      </div>
      
      <input name="email" ngModel email required />
      
      <button type="submit" [disabled]="form.invalid">Submit</button>
    </form>
  `
})
export class TemplateFormComponent {
  onSubmit(value: any) {
    console.log(value);
  }
}
```

## RxJS Integration

```ts
import { Component, inject, OnInit, OnDestroy } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { takeUntil, map, filter } from 'rxjs/operators';
import { AsyncPipe } from '@angular/common';

@Component({
  selector: 'app-rxjs',
  standalone: true,
  imports: [AsyncPipe],
  template: `
    <p>Users: {{ users$ | async }}</p>
  `
})
export class RxjsComponent implements OnInit, OnDestroy {
  private userService = inject(UserService);
  private destroy$ = new Subject<void>();
  
  users$!: Observable<string[]>;
  
  ngOnInit() {
    this.users$ = this.userService.getUsers().pipe(
      map(users => users.map(u => u.name)),
      filter(names => names.length > 0),
      takeUntil(this.destroy$)
    );
  }
  
  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
  }
}
```

## See Also

- [Angular Documentation](https://angular.dev)
- [Angular Signals](https://angular.dev/guide/signals)
- [Angular Router](https://angular.dev/guide/routing)
- [RxJS Documentation](https://rxjs.dev)
