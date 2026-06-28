# useBeforeUnload

## Signature

```tsx
function useBeforeUnload(
  callback: (event: BeforeUnloadEvent) => any,
  options?: {
    capture?: boolean;
  },
): void
```

## Params

### callback

The callback to be called when the [`beforeunload` event](https://developer.mozilla.org/en-US/docs/Web/API/Window/beforeunload_event) is fired.

### options.capture

If `true`, the event will be captured during the capture phase. Defaults to `false`.

