# matchPath

## Signature

```tsx
function matchPath<Path extends string>(
  pattern: PathPattern | Path,
  pathname: string,
): PathMatch<ParamParseKey> | null
```

## Params

### pattern

The pattern to match against the URL pathname. This can be a string or a [`PathPattern`](https://api.reactrouter.com/v7/interfaces/react-router.PathPattern.html) object. If a string is provided, it will be
treated as a pattern with `caseSensitive` set to `false` and `end` set to
`true`.

### pathname

The URL pathname to match against the pattern.

## Returns

A path match object if the pattern matches the pathname,
or `null` if it does not match.

