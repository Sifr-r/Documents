# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Always provide a specific `targetOrigin`, not `*`, if you know where the other window's document should be located. Failing to provide a specific target could disclose data to a malicious site.
    >
    > Because [`data:`](/en-US/docs/Web/URI/Reference/Schemes/data) URLs have opaque origins, in order to send messages to a context with a `data:` URL, you must specify `"*"`.

## Security Notes

**If you do not expect to receive messages from other sites, _do not_ add any event listeners for `message` events.** This is a completely foolproof way to avoid security problems.

If you do expect to receive messages from other sites, **always verify the sender's identity** using the `origin` and possibly `source` properties. Any window (including, for example, `http://evil.example.com`) can send a message to any other window within the iframe hierarchy from top to every iframe below of the current document. Having verified identity, however, you still should **always verify the syntax of the received message**. Otherwise, a security hole in the site you trusted to send only trusted messages could then open a cross-site scripting hole in your site.

**Always specify an exact target origin, not `*`, when you use `postMessage` to dispatch data to other windows.** A malicious site can change the location of the window without your knowledge, and therefore it can intercept the data sent using `postMessage`.

### Secure shared memory messaging

If `postMessage()` throws when used with {{jsxref("SharedArrayBuffer")}} objects, you might need to make sure you cross-site isolated your site properly. Shared memory is gated behind two HTTP headers:

- {{HTTPHeader("Cross-Origin-Opener-Policy")}} with `same-origin` as value (protects your origin from attackers)
- {{HTTPHeader("Cross-Origin-Embedder-Policy")}} with `require-corp` or `credentialless` as value (protects victims from your origin)

```http
Cross-Origin-Opener-Policy: same-origin
Cross-Origin-Embedder-Policy: require-corp
```

To check if cross origin isolation has been successful, you can test against the {{domxref("Window.crossOriginIsolated")}} property available to window and worker contexts:

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

