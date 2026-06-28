# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > A service worker is not in the same [agent cluster](/en-US/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing) as its client, and therefore cannot share memory. {{jsxref("SharedArrayBuffer")}} objects, or buffer views backed by one, cannot be posted across agent clusters. Trying to do so will generate a {{domxref("BroadcastChannel/messageerror_event", "messageerror")}} event containing a `DataCloneError` {{domxref("DOMException")}} on the receiving end.

## Exceptions

- {{jsxref("SyntaxError")}}
  - : Thrown if the `message` parameter is not provided.

