# React

React is a JavaScript library for building user interfaces using a component-based architecture. React 18+ introduces concurrent features, automatic batching, and Suspense for data fetching.

## Topics

| Topic | File | Description |
|-------|------|-------------|
| Core | [core.md](core.md) | Components, hooks, state, effects, context, refs, and performance |

## Quick Reference

### Functional Component

```jsx
function Greeting({ name }) {
  return <h1>Hello, {name}</h1>;
}
```

### State with useState

```jsx
const [count, setCount] = useState(0);
```

### Side Effects with useEffect

```jsx
useEffect(() => {
  document.title = `Count: ${count}`;
  return () => { /* cleanup */ };
}, [count]);
```

### Context

```jsx
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
  return <div className={theme} />;
}
```

### Memoization

```jsx
const expensive = useMemo(() => compute(a, b), [a, b]);
const handleClick = useCallback(() => doSomething(id), [id]);
const MemoizedComponent = React.memo(({ data }) => <div>{data}</div>);
```

### Refs

```jsx
const inputRef = useRef(null);

useEffect(() => {
  inputRef.current.focus();
}, []);
```

### Suspense and Lazy Loading

```jsx
const LazyComponent = lazy(() => import('./HeavyComponent'));

function App() {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <LazyComponent />
    </Suspense>
  );
}
```

### useReducer

```jsx
function reducer(state, action) {
  switch (action.type) {
    case 'increment': return { count: state.count + 1 };
    case 'decrement': return { count: state.count - 1 };
    default: return state;
  }
}

const [state, dispatch] = useReducer(reducer, { count: 0 });
```
