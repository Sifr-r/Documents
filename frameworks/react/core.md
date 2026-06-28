# React — Core

## Functional Components and JSX

```jsx
function Welcome({ name }) {
  return <h1>Hello, {name}</h1>;
}

// Arrow function
const Button = ({ onClick, children }) => (
  <button onClick={onClick}>{children}</button>
);
```

## Props and Children

```jsx
function Card({ title, children }) {
  return (
    <div className="card">
      <h2>{title}</h2>
      {children}
    </div>
  );
}

// Default props
Card.defaultProps = {
  title: 'Default Title'
};
```

## State: useState

```jsx
import { useState } from 'react';

function Counter() {
  const [count, setCount] = useState(0);
  
  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment</button>
    </div>
  );
}
```

## State: useReducer

```jsx
import { useReducer } from 'react';

function reducer(state, action) {
  switch (action.type) {
    case 'increment':
      return { count: state.count + 1 };
    case 'decrement':
      return { count: state.count - 1 };
    default:
      throw new Error();
  }
}

function Counter() {
  const [state, dispatch] = useReducer(reducer, { count: 0 });
  
  return (
    <>
      Count: {state.count}
      <button onClick={() => dispatch({ type: 'increment' })}>+</button>
    </>
  );
}
```

## Effects: useEffect

```jsx
import { useEffect, useState } from 'react';

function Example() {
  const [data, setData] = useState(null);

  useEffect(() => {
    // Side effect
    fetchData().then(result => setData(result));
    
    // Cleanup function
    return () => {
      // Cleanup code
    };
  }, []); // Empty dependency array = run once
  
  return <div>{data}</div>;
}
```

## Effects: useLayoutEffect

```jsx
import { useLayoutEffect, useRef } from 'react';

function Example() {
  const ref = useRef();
  
  useLayoutEffect(() => {
    // Runs synchronously after DOM mutations
    const height = ref.current.offsetHeight;
    console.log(height);
  }, []);
  
  return <div ref={ref}>Content</div>;
}
```

## Context: createContext and useContext

```jsx
import { createContext, useContext } from 'react';

const ThemeContext = createContext('light');

function App() {
  return (
    <ThemeContext.Provider value="dark">
      <Toolbar />
    </ThemeContext.Provider>
  );
}

function Toolbar() {
  const theme = useContext(ThemeContext);
  return <div className={theme}>Toolbar</div>;
}
```

## Performance: useMemo

```jsx
import { useMemo } from 'react';

function ExpensiveComponent({ items, filter }) {
  const filteredItems = useMemo(() => {
    return items.filter(item => item.includes(filter));
  }, [items, filter]); // Only recompute when dependencies change
  
  return <ul>{filteredItems.map(item => <li key={item}>{item}</li>)}</ul>;
}
```

## Performance: useCallback

```jsx
import { useCallback } from 'react';

function Parent() {
  const handleClick = useCallback((id) => {
    console.log('Clicked:', id);
  }, []); // Memoized callback
  
  return <Child onClick={handleClick} />;
}
```

## Performance: React.memo

```jsx
import { memo } from 'react';

const Child = memo(({ data }) => {
  console.log('Child rendered');
  return <div>{data}</div>;
});
```

## Refs: useRef

```jsx
import { useRef } from 'react';

function Input() {
  const inputRef = useRef(null);
  
  const focusInput = () => {
    inputRef.current.focus();
  };
  
  return (
    <>
      <input ref={inputRef} />
      <button onClick={focusInput}>Focus</button>
    </>
  );
}
```

## Refs: forwardRef

```jsx
import { forwardRef } from 'react';

const FancyInput = forwardRef((props, ref) => (
  <input ref={ref} className="fancy" {...props} />
));

function Parent() {
  const inputRef = useRef();
  return <FancyInput ref={inputRef} />;
}
```

## Refs: useImperativeHandle

```jsx
import { forwardRef, useImperativeHandle, useRef } from 'react';

const CustomInput = forwardRef((props, ref) => {
  const inputRef = useRef();
  
  useImperativeHandle(ref, () => ({
    focus: () => inputRef.current.focus(),
    clear: () => inputRef.current.value = ''
  }));
  
  return <input ref={inputRef} />;
});
```

## Forms: Controlled Components

```jsx
function Form() {
  const [value, setValue] = useState('');
  
  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Submitted:', value);
  };
  
  return (
    <form onSubmit={handleSubmit}>
      <input
        value={value}
        onChange={(e) => setValue(e.target.value)}
      />
      <button type="submit">Submit</button>
    </form>
  );
}
```

## Error Boundaries

```jsx
class ErrorBoundary extends React.Component {
  constructor(props) {
    super(props);
    this.state = { hasError: false };
  }

  static getDerivedStateFromError(error) {
    return { hasError: true };
  }

  componentDidCatch(error, errorInfo) {
    console.error('Error caught:', error, errorInfo);
  }

  render() {
    if (this.state.hasError) {
      return <h1>Something went wrong.</h1>;
    }
    return this.props.children;
  }
}

// Usage
<ErrorBoundary>
  <RiskyComponent />
</ErrorBoundary>
```

## Suspense and lazy

```jsx
import { Suspense, lazy } from 'react';

const LazyComponent = lazy(() => import('./HeavyComponent'));

function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <LazyComponent />
    </Suspense>
  );
}
```

## See Also

- [React Documentation](https://react.dev)
- [React Hooks API](https://react.dev/reference/react)
- [React Component API](https://react.dev/reference/react/Component)
