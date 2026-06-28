# Fringe Cases

## Security Notes

To offer protection against timing attacks and [fingerprinting](/en-US/docs/Glossary/Fingerprinting), `performance.now()` is coarsened based on whether or not the document is {{domxref("Window.crossOriginIsolated","cross-origin isolated","","nocode")}}.

- Resolution in isolated contexts: 5 microseconds
- Resolution in non-isolated contexts: 100 microseconds

You can use the {{domxref("Window.crossOriginIsolated")}} and {{domxref("WorkerGlobalScope.crossOriginIsolated")}} properties to check if the document is cross-origin isolated:

```js
if (crossOriginIsolated) {
  // Use measureUserAgentSpecificMemory
}
```

