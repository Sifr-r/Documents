# Fringe Cases

## Security Notes

Shared memory and high-resolution timers were effectively [disabled at the start of 2018](https://blog.mozilla.org/security/2018/01/03/mitigations-landing-new-class-timing-attack/) in light of [Spectre](<https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)>).
In 2020, a new, secure approach has been standardized to re-enable shared memory.

To use shared memory your document must be in a [secure context](/en-US/docs/Web/Security/Defenses/Secure_Contexts) and {{domxref("Window.crossOriginIsolated","cross-origin isolated","","nocode")}}.
You can use the {{domxref("Window.crossOriginIsolated")}} and {{domxref("WorkerGlobalScope.crossOriginIsolated")}} properties to check if the document is cross-origin isolated:

```js
const myWorker = new Worker("worker.js");

if (crossOriginIsolated) {
  const buffer = new SharedArrayBuffer(16);
  myWorker.postMessage(buffer);
} else {
  const buffer = new ArrayBuffer(16);
  myWorker.postMessage(buffer);
}
```

When cross-origin isolated, `postMessage()` no longer throws for `SharedArrayBuffer` objects, and shared memory across threads is therefore available.

