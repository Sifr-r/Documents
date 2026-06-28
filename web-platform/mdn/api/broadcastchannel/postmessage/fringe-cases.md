# Fringe Cases

## Warnings & Notes

> [!NOTE]
    > Execution contexts that can message each other may not be in the same [agent cluster](/en-US/docs/Web/JavaScript/Reference/Execution_model#agent_clusters_and_memory_sharing), and therefore cannot share memory. {{jsxref("SharedArrayBuffer")}} objects, or buffer views backed by one, cannot be posted across agent clusters. Trying to do so will generate a {{domxref("BroadcastChannel/messageerror_event", "messageerror")}} event containing a `DataCloneError` {{domxref("DOMException")}} on the receiving end.

## Exceptions

- `InvalidStateError` {{domxref("DOMException")}}
  - : Thrown if the {{domxref("BroadcastChannel")}} has already been closed.
- `DataCloneError` {{domxref("DOMException")}}
  - : Thrown if any part of the input data is not serializable.

