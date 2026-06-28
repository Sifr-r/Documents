# useMatch

## Signature

```tsx
function useMatch<Path extends string>(
  pattern: PathPattern | Path,
): PathMatch<ParamParseKey> | null
```

## Returns

The path match object if the pattern matches, `null` otherwise

