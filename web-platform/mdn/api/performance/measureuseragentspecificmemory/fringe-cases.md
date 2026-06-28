# Fringe Cases

## Exceptions

- `SecurityError` {{domxref("DOMException")}}
  - : Thrown if the [security requirements](#security_requirements) for preventing cross-origin information leaks aren't fulfilled.

## Security Notes

To use this method your document must be in a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts) and {{domxref("Window.crossOriginIsolated","cross-origin isolated","","nocode")}}.

You can use the {{domxref("Window.crossOriginIsolated")}} and {{domxref("WorkerGlobalScope.crossOriginIsolated")}} properties to check if the document is cross-origin isolated:

```js
if (crossOriginIsolated) {
  // Use measureUserAgentSpecificMemory
}
```

