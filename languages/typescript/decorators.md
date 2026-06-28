# TypeScript — Decorators

## TC39 Decorators (Stage 3, TS 5+)

```ts
// Class decorator
function sealed(target: Function, context: ClassDecoratorContext) {
    Object.seal(target);
    Object.seal(target.prototype);
}

@sealed
class MyClass {}

// Method decorator
function logged<This, Args extends any[], Return>(
    target: (this: This, ...args: Args) => Return,
    context: ClassMethodDecoratorContext<This, (this: This, ...args: Args) => Return>
) {
    return function (this: This, ...args: Args): Return {
        console.log(`Calling ${String(context.name)}`);
        return target.apply(this, args);
    };
}

class Calculator {
    @logged
    add(a: number, b: number): number { return a + b; }
}

// Accessor decorator (getter/setter)
function uppercase<This, Value>(
    target: ClassAccessorDecoratorTarget<This, Value>,
    context: ClassAccessorDecoratorContext<This, Value>
): ClassAccessorDecoratorResult<This, Value> {
    return {
        get(this: This) { return target.get.call(this); },
        set(this: This, value: Value) {
            target.set.call(this, String(value).toUpperCase() as any);
        }
    };
}

// Field decorator (initializer)
function init<T>(value: T) {
    return (_: undefined, context: ClassFieldDecoratorContext) => {
        return () => value;
    };
}
```

## Legacy Decorators (experimentalDecorators)

```ts
// Class decorator
function Component(config: { selector: string }) {
    return <T extends { new(...args: any[]): {} }>(target: T) => {
        return class extends target {
            selector = config.selector;
        };
    };
}

// Method decorator
function Log(target: any, propertyKey: string, descriptor: PropertyDescriptor) {
    const original = descriptor.value;
    descriptor.value = function (...args: any[]) {
        console.log(`${propertyKey} called`);
        return original.apply(this, args);
    };
}

// Property decorator
function Required(target: any, propertyKey: string) {
    Reflect.defineMetadata("required", true, target, propertyKey);
}

// Parameter decorator
function Inject(token: string) {
    return (target: any, propertyKey: string, parameterIndex: number) => {
        // Used by DI frameworks
    };
}
```

## Common Patterns

```ts
// Memoize
function memoize(target: any, key: string, descriptor: PropertyDescriptor) {
    const original = descriptor.value;
    const cache = new Map();
    descriptor.value = function (...args: any[]) {
        const k = JSON.stringify(args);
        if (!cache.has(k)) cache.set(k, original.apply(this, args));
        return cache.get(k);
    };
}

// Debounce
function debounce(ms: number) {
    let timeout: ReturnType<typeof setTimeout>;
    return (_: any, __: string, descriptor: PropertyDescriptor) => {
        const original = descriptor.value;
        descriptor.value = function (...args: any[]) {
            clearTimeout(timeout);
            timeout = setTimeout(() => original.apply(this, args), ms);
        };
    };
}

// Validation
function validate(schema: Record<string, string>) {
    return <T extends { new(...args: any[]): {} }>(target: T) => {
        return class extends target {
            validate() {
                for (const [key, type] of Object.entries(schema)) {
                    if (typeof (this as any)[key] !== type) return false;
                }
                return true;
            }
        };
    };
}
```

## See Also

- [core.md](core.md) — type annotations, narrowing
- [types.md](types.md) — type system reference
- [generics.md](generics.md) — generic functions, constraints