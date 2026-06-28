# Fringe Cases

## Exceptions

- `InvalidStateNode` {{domxref("DOMException")}}
  - : Thrown if the node has already been started. This error occurs even if the node is no longer
    running because of a prior call to {{domxref("AudioScheduledSourceNode.stop", "stop()")}}.
- {{jsxref("RangeError")}}
  - : Thrown if the value specified for `when` is negative.

